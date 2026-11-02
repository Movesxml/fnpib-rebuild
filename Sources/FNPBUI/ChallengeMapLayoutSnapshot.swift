//
//  ChallengeMapLayoutSnapshot.swift
//  FNPBUI
//
//  挑战地图 UIScreen 组件的只读值投影。
//  本文件不 import FNPBCore；App 层负责转换 Core 投影。
//

import Foundation

public struct ChallengeMapLayoutPoint: Sendable, Equatable {
    public var x: Float
    public var y: Float
    public var z: Float

    public init(x: Float, y: Float, z: Float) {
        self.x = x
        self.y = y
        self.z = z
    }
}

public struct ChallengeMapLayoutCorners: Sendable, Equatable {
    public var minimumXMinimumY: ChallengeMapLayoutPoint
    public var maximumXMinimumY: ChallengeMapLayoutPoint
    public var maximumXMaximumY: ChallengeMapLayoutPoint
    public var minimumXMaximumY: ChallengeMapLayoutPoint

    public init(minimumXMinimumY: ChallengeMapLayoutPoint,
                maximumXMinimumY: ChallengeMapLayoutPoint,
                maximumXMaximumY: ChallengeMapLayoutPoint,
                minimumXMaximumY: ChallengeMapLayoutPoint) {
        self.minimumXMinimumY = minimumXMinimumY
        self.maximumXMinimumY = maximumXMinimumY
        self.maximumXMaximumY = maximumXMaximumY
        self.minimumXMaximumY = minimumXMaximumY
    }
}

/// RGBA bytes in original order; not premultiplied or normalized.
public struct ChallengeMapLayoutColor: Sendable, Equatable {
    public var red: UInt8
    public var green: UInt8
    public var blue: UInt8
    public var alpha: UInt8

    public init(red: UInt8, green: UInt8, blue: UInt8, alpha: UInt8) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
}

/// A column-major 4×4 matrix with a fixed 16-Float representation.
public struct ChallengeMapLayoutMatrix4: Sendable, Equatable {
    public var column0: SIMD4<Float>
    public var column1: SIMD4<Float>
    public var column2: SIMD4<Float>
    public var column3: SIMD4<Float>

    public init(column0: SIMD4<Float>, column1: SIMD4<Float>,
                column2: SIMD4<Float>, column3: SIMD4<Float>) {
        self.column0 = column0
        self.column1 = column1
        self.column2 = column2
        self.column3 = column3
    }

    public init?(elements: [Float]) {
        guard elements.count == 16 else { return nil }
        self.init(
            column0: SIMD4(elements[0], elements[1], elements[2], elements[3]),
            column1: SIMD4(elements[4], elements[5], elements[6], elements[7]),
            column2: SIMD4(elements[8], elements[9], elements[10], elements[11]),
            column3: SIMD4(elements[12], elements[13], elements[14], elements[15]))
    }

    public var elements: [Float] {
        [column0.x, column0.y, column0.z, column0.w,
         column1.x, column1.y, column1.z, column1.w,
         column2.x, column2.y, column2.z, column2.w,
         column3.x, column3.y, column3.z, column3.w]
    }
}

/// Pure UI value; UV signs and resource paths are preserved without reinterpretation.
public struct ChallengeMapLayoutComponent: Sendable, Equatable, Identifiable {
    public var name: String
    public var index: Int
    public var parentIndex: Int?
    public var worldMatrix: ChallengeMapLayoutMatrix4
    public var worldCorners: ChallengeMapLayoutCorners
    public var width: Float
    public var height: Float
    public var effectiveOrigin: ChallengeMapLayoutPoint
    public var localRGBA: ChallengeMapLayoutColor
    public var absoluteRGBA: ChallengeMapLayoutColor
    public var enabled: Bool
    public var screenVisibility: Bool
    public var texturePath: String?
    public var texCoordPos: SIMD2<Float>
    public var texCoordSize: SIMD2<Float>
    public var iconIndex: Int32?

    public var id: Int { index }

    public init(name: String,
                index: Int,
                parentIndex: Int?,
                worldMatrix: ChallengeMapLayoutMatrix4,
                worldCorners: ChallengeMapLayoutCorners,
                width: Float,
                height: Float,
                effectiveOrigin: ChallengeMapLayoutPoint,
                localRGBA: ChallengeMapLayoutColor,
                absoluteRGBA: ChallengeMapLayoutColor,
                enabled: Bool,
                screenVisibility: Bool,
                texturePath: String?,
                texCoordPos: SIMD2<Float>,
                texCoordSize: SIMD2<Float>,
                iconIndex: Int32?) {
        self.name = name
        self.index = index
        self.parentIndex = parentIndex
        self.worldMatrix = worldMatrix
        self.worldCorners = worldCorners
        self.width = width
        self.height = height
        self.effectiveOrigin = effectiveOrigin
        self.localRGBA = localRGBA
        self.absoluteRGBA = absoluteRGBA
        self.enabled = enabled
        self.screenVisibility = screenVisibility
        self.texturePath = texturePath
        self.texCoordPos = texCoordPos
        self.texCoordSize = texCoordSize
        self.iconIndex = iconIndex
    }
}
