import Foundation
import simd

// ============================================================================
// ECS 正式定义（T-015）
//
// 来源与迁移：
//   - 本文件字段集来自 T-011 `GameWorld.swift` 的「过渡占位类型」节（原样迁移）
//   - `EntityKind` 数值来自 DECISIONS T-004（M20）：1 fruit / 2 bomb / 3 coin /
//     4 slash / 5 blast / 6 jiblet / 7 fruitray [macho]
//   - `EntityTransform` 在迁移时**扩展**了旋转字段（`rotation` / `angularVelocity`），
//     原引擎的水果旋转表示未从 macho 直读 → 标 [待验证]
//   - `EntityPrototype` 为 T-015 新增：生成器（WaveDirector / Spawner）产出的实体描述，
//     与 `Entity` 解耦，避免生成侧直接构造带 id 的实体
//
// ⚠️ 全工程只允许存在这一份 Entity / EntityID / EntityKind / EntityTransform 定义；
//    `GameWorld.swift` 的过渡节已删除（T-015）。
// ============================================================================

// MARK: - EntityID

/// 实体标识。
///
/// - 由 `GenerationOrderStore` 单调分配，**despawn 后不复用**（id 稳定约束）。
/// - `rawValue == 0` 保留为「无实体」哨兵：原 `+0x180` 用空指针表示上一个
///   combo 实体（core_logic_notes §0）[both]，映射到 0 避免 Optional 穿透到逻辑层。
public struct EntityID: Hashable, Sendable, Comparable {

    public let rawValue: UInt32

    public init(rawValue: UInt32) { self.rawValue = rawValue }

    public static func < (lhs: Self, rhs: Self) -> Bool { lhs.rawValue < rhs.rawValue }

    /// 0 = 无实体（原 `+0x180 == 0`）。不是合法实体 id。
    public static let invalid = EntityID(rawValue: 0)
}

// MARK: - EntityKind

/// M20 实体类型枚举：1 fruit / 2 bomb / 3 coin / 4 slash / 5 blast / 6 jiblet / 7 fruitray [macho]
///
/// 数值即原引擎的 type 字段（`+0x35` / `piVar13[0x30]` 系列判断的取值域），
/// 不得重排。`other == 0` 对应主循环「循环 C（type=0 其他）」[macho]。
public enum EntityKind: Int32, Sendable, CaseIterable {
    case other = 0
    case fruit = 1
    case bomb = 2
    case coin = 3
    case slash = 4
    case blast = 5
    case jiblet = 6
    case fruitray = 7
}

// MARK: - EntityTransform

/// 实体空间状态（位置/速度/旋转/尺寸）。
///
/// 默认值与 `FruitInfo` 的元数据默认值同源（macho H，core_logic_notes §4.5）：
/// `scale = 25.0`、`collision = 1.0`，引用 `Constants.FruitDefaults` 而非散落字面量。
public struct EntityTransform: Sendable, Equatable {

    /// 世界坐标位置。
    public var position: SIMD3<Float> = .zero

    /// 线速度（世界单位/秒）。
    public var velocity: SIMD3<Float> = .zero

    /// 旋转量（欧拉角，弧度）。
    /// ⚠️ [待验证] 原引擎水果自转的表示（轴角 / 欧拉 / 仅 2D 角）未从 macho 直读，
    ///    此处取 3 分量欧拉角作占位，FruitMotion 只做线性累加。
    public var rotation: SIMD3<Float> = .zero

    /// 角速度（弧度/秒）。[待验证] 同 `rotation`。
    public var angularVelocity: SIMD3<Float> = .zero

    /// 渲染缩放。FruitInfo.scale 默认 [macho H]
    public var scale: Float = Constants.FruitDefaults.scale

    /// 碰撞半径。FruitInfo.collision 默认 [macho H]
    /// 注意：切割判定实际用的是「归一化后的半径权重」（§1.2 步骤 2），
    /// 该字段是源数据，不要在此处预乘。
    public var radius: Float = Constants.FruitDefaults.collision

    public init() {}

    public init(position: SIMD3<Float>,
                velocity: SIMD3<Float> = .zero,
                rotation: SIMD3<Float> = .zero,
                angularVelocity: SIMD3<Float> = .zero,
                scale: Float = Constants.FruitDefaults.scale,
                radius: Float = Constants.FruitDefaults.collision) {
        self.position = position
        self.velocity = velocity
        self.rotation = rotation
        self.angularVelocity = angularVelocity
        self.scale = scale
        self.radius = radius
    }
}

// MARK: - Entity

/// 单个实体（值类型）。
///
/// 字段→原偏移映射沿用 T-011 注释：
///   - `flags`         ↔ `(piVar13[3] & 1)` 等位域
///   - `stateSlot0..2` ↔ `+0x21 / +0x26 / +0x33`（L3 语义未闭合，禁止 enum 化）
///   - `isMarked`      ↔ `+0x6f == 0` 才参与切割判定
///   - `isVisible`     ↔ `+0x30 != 0`
///   - `fallDelay`     ↔ `+0x2b > 0` 跳过
///   - `dropState`     ↔ `+0x41 <= -1.0` 为下落态
public struct Entity: Sendable {

    public var id: EntityID
    public var kind: EntityKind
    public var transform: EntityTransform

    /// 该实体的水果元数据（类型/分值/命中影响等）。
    /// 生成时由 `EntityPrototype` 带入；Jiblet/Slash 等非水果实体为 nil。
    /// 值类型拷贝，单个实体几十字节量级，暂不做引用化。
    public var fruit: FruitInfo?

    /// 原 (piVar13[3] & 1) 等位域。
    public var flags: UInt32 = 0

    /// L3：状态槽语义仅 [M] 级，禁止提前 enum 化（原 0x21/0x26/0x33/0x6e/0x6f）
    public var stateSlot0: Int32 = 0
    public var stateSlot1: Int32 = 0
    public var stateSlot2: Int32 = 0

    /// 原 +0x6f==0 才参与判定
    public var isMarked: Bool = false
    /// 原 +0x30!=0
    public var isVisible: Bool = true
    /// 原 +0x2b > 0 跳过
    public var fallDelay: Float = 0
    /// 原 +0x41 <= -1.0 为下落态
    public var dropState: Float = 0

    public init(id: EntityID, kind: EntityKind) {
        self.id = id
        self.kind = kind
        self.transform = EntityTransform()
        self.fruit = nil
    }
}

// MARK: - EntityPrototype

/// 实体生成描述（不含 id）。
///
/// 由波次/生成器侧构造，交给 `EntityStore.spawn` 换取 `EntityID`；
/// 其余状态槽/标记一律取 `Entity` 的默认值（生成瞬间的语义尚未闭合，不在此臆造）。
public struct EntityPrototype: Sendable {

    public var kind: EntityKind
    public var transform: EntityTransform
    public var fruit: FruitInfo?

    public init(kind: EntityKind,
                transform: EntityTransform = EntityTransform(),
                fruit: FruitInfo? = nil) {
        self.kind = kind
        self.transform = transform
        self.fruit = fruit
    }
}