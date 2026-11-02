import Foundation
import simd

/// FUN_00057000 与 FUN_000568f4 共用的 Spawn 坐标、placement 和 RNG 顺序。
/// 水果与炸弹仅保留方向角、z 和位置偏移差异；不再各自漂移一套实现。
enum OriginalSpawnMotion {
    enum Kind {
        case fruit
        case bomb
    }

    static func spawnState(rng: any RandomSource,
                           spawner: Spawner,
                           tuning: FruitMotionTuning,
                           kind: Kind)
        -> (position: SIMD3<Float>, velocity: SIMD3<Float>, acceleration: SIMD3<Float>) {
        let sidePlacement = spawner.placementCode > 1

        // +0x2c 的 -1 是未提供哨兵。只有该分支消费横向 RNG；负浮点按 ARM
        // vcvt.u32.f32 饱和到 0，而不是 Swift 转换时触发运行时陷阱。
        var x: Int32
        if let explicitX = spawner.posX, explicitX != -1 {
            x = explicitX
        } else {
            let random = rng.nextFloat()
            let horizontal = spawner.horizMin
                + (spawner.horizMax - spawner.horizMin) * random
            let scaled = horizontal * Constants.Physics.horizontalRandomScale
            x = Int32(bitPattern: FruitMotion.armUnsignedSaturate(scaled))
        }

        // +0x30 的缺省基值是 trunc(320 * -0.5)；显式 posY 是从基值中减去。
        var y = Int32(-160)
        if let explicitY = spawner.posY, explicitY != -1 {
            y = y &- explicitY
        }

        // sin/cos 未提供时原构造器保留 -1，不是 0；半径缺省为 0。
        let radius = spawner.radius ?? 0
        let sineDegrees = spawner.sin ?? -1
        if sineDegrees != 0, radius != 0 {
            let offset = OriginalSpawnTrigonometry.sin(degrees: sineDegrees) * Float(radius)
            y = y &+ Int32(offset.rounded(.towardZero))
        }
        let cosineDegrees = spawner.cos ?? -1
        if cosineDegrees != 0, radius != 0 {
            let offset = OriginalSpawnTrigonometry.cos(degrees: cosineDegrees) * Float(radius)
            x = x &+ Int32(offset.rounded(.towardZero))
        }

        // 两个构造器都在这里先消费速度 RNG，即使显式速度分支不再使用 speed，
        // 侧向分支仍会用 speed 修正水平速度。
        let minimumSpeed = kind == .fruit
            ? Constants.Physics.minimumLaunchSpeed : Constants.BombPhysics.minimumLaunchSpeed
        let speedRange = kind == .fruit
            ? Constants.Physics.launchSpeedRange : Constants.BombPhysics.launchSpeedRange
        let speed = minimumSpeed + speedRange * rng.nextFloat()

        var velocityX: Float
        var velocityY: Float
        if spawner.velocityX != 0 || spawner.velocityY != 0 {
            velocityX = spawner.velocityX * spawner.velocityScaleX
            velocityY = spawner.velocityY * spawner.velocityScaleY
        } else {
            switch kind {
            case .fruit:
                let direction = rng.nextFloat() - 0.5
                let curve = 0.5 - 2 * pow(0.5 - abs(direction), 2)
                let sign: Float = direction < 0 ? -1 : 1
                let angleScale = sidePlacement ? Float(12) : Constants.Physics.directionAngleScale
                let positionAdjustment = -angleScale * Float(x)
                    / Constants.Physics.horizontalRandomScale
                let angle = positionAdjustment + sign * angleScale * curve
                let degrees = Int32(angle.rounded(.towardZero))
                velocityX = speed * OriginalSpawnTrigonometry.sin(degrees: degrees)
                    * spawner.velocityScaleX
                velocityY = speed * OriginalSpawnTrigonometry.cos(degrees: degrees)
                    * Constants.Physics.verticalVelocityScale * spawner.velocityScaleY
            case .bomb:
                // 原版直接 high * range >> 32；不是先量化成 nextFloat 再取 floor。
                let angleScale = sidePlacement ? Int32(6) : Constants.BombPhysics.horizontalAngleScale
                let adjustment = Int32((Float(angleScale) * Float(x)
                    / Constants.BombPhysics.horizontalPositionDivisor).rounded(.towardZero))
                let degrees = adjustment - angleScale + rng.nextInt(2 * angleScale)
                velocityX = speed * OriginalSpawnTrigonometry.sin(degrees: degrees)
                    * spawner.velocityScaleX
                velocityY = speed * OriginalSpawnTrigonometry.cos(degrees: degrees)
                    * Constants.BombPhysics.verticalVelocityScale * spawner.velocityScaleY
            }
        }

        let gravity = spawner.gravity ?? Constants.Physics.defaultGravity
        var acceleration = -Constants.Physics.constructedAccelerationY * gravity
        var position = SIMD3<Float>(Float(x), Float(y), kind == .bomb ? 32 : 0)
        let offset: Float = kind == .fruit ? 55 : 100

        switch spawner.placementCode {
        case 1: // TOP：位置与速度翻号，y 速度先减半；重力不在此分支翻转。
            position.x = -position.x
            position.y = -position.y + offset
            velocityX = -velocityX
            velocityY = -0.5 * velocityY
        case 2, 3, 4: // LEFT / RIGHT / LEFT_RIGHT
            var resolved = spawner.placementCode
            if resolved == 4 {
                // upperBound=0 在 OriginalLCGRandom 中返回本次推进的有符号高 32 位。
                resolved = rng.nextInt(0) < 0 ? 3 : 2
            }

            let logicalWidth = tuning.logicalWidth
            let transformedX = Int32((Float(x) * 320 / logicalWidth).rounded(.towardZero))
            let transformedY = Int32((Float(-y) * logicalWidth / 320).rounded(.towardZero))
            let horizontalVelocity = velocityX + speed * gravity.y * Float(-0.65)
            let verticalVelocity = velocityY * Float(-0.75)

            if resolved == 2 {
                position = SIMD3<Float>(-Float(transformedY) - offset,
                                        Float(transformedX), position.z)
                velocityX = -horizontalVelocity
                acceleration.x += 0.01
            } else {
                position = SIMD3<Float>(Float(transformedY) + offset,
                                        Float(transformedX), position.z)
                velocityX = horizontalVelocity
                acceleration.x -= 0.01
            }
            velocityY = verticalVelocity
        default: // BOTTOM 及未知值：原始负 y 偏移（水果 55、炸弹 100）。
            position.y -= offset
        }

        return (position, SIMD3<Float>(velocityX, velocityY, 0), acceleration)
    }
}
