//
//  ChallengeMapLayoutGeometry.swift
//  FNPBUI
//
//  Geometry only: display-tree filtering and draw order are handled separately.
//

import CoreGraphics

public struct ChallengeMapLayoutVertex: Sendable, Equatable {
    public var position: CGPoint
    public var texCoord: CGPoint

    public init(position: CGPoint, texCoord: CGPoint) {
        self.position = position
        self.texCoord = texCoord
    }
}

public struct ChallengeMapLayoutQuad: Sendable, Equatable {
    /// (0,0), (width,0), (width,height), (0,height), with matching UV at each vertex.
    public var vertices: [ChallengeMapLayoutVertex]

    public init(vertices: [ChallengeMapLayoutVertex]) {
        self.vertices = vertices
    }
}

public enum ChallengeMapLayoutGeometry {
    public static let referenceWidth: CGFloat = 480
    public static let referenceHeight: CGFloat = 320

    /// Column-major 4×4 to a 2D affine transform, without changing multiplication order.
    public static func localAffineTransform(
        for component: ChallengeMapLayoutComponent
    ) -> CGAffineTransform {
        let matrix = component.worldMatrix
        return CGAffineTransform(
            a: CGFloat(matrix.column0.x), b: CGFloat(matrix.column0.y),
            c: CGFloat(matrix.column1.x), d: CGFloat(matrix.column1.y),
            tx: CGFloat(matrix.column3.x), ty: CGFloat(matrix.column3.y))
    }

    public static func deviceScaleTransform(
        deviceWidth: CGFloat, deviceHeight: CGFloat
    ) -> CGAffineTransform {
        CGAffineTransform(scaleX: deviceWidth / referenceWidth,
                          y: deviceHeight / referenceHeight)
    }

    /// Original `.scale` root mode: independent x/y ratios, not aspect-fit or centering.
    public static func deviceSpaceAffineTransform(
        for component: ChallengeMapLayoutComponent,
        deviceWidth: CGFloat, deviceHeight: CGFloat
    ) -> CGAffineTransform {
        localAffineTransform(for: component).concatenating(
            deviceScaleTransform(deviceWidth: deviceWidth, deviceHeight: deviceHeight))
    }

    public static func positions(
        for component: ChallengeMapLayoutComponent,
        deviceWidth: CGFloat, deviceHeight: CGFloat
    ) -> [CGPoint] {
        let originX = CGFloat(component.effectiveOrigin.x)
        let originY = CGFloat(component.effectiveOrigin.y)
        let width = CGFloat(component.width)
        let height = CGFloat(component.height)
        let localPositions = [
            CGPoint(x: -originX, y: -originY),
            CGPoint(x: width - originX, y: -originY),
            CGPoint(x: width - originX, y: height - originY),
            CGPoint(x: -originX, y: height - originY),
        ]
        let transform = deviceSpaceAffineTransform(
            for: component, deviceWidth: deviceWidth, deviceHeight: deviceHeight)
        return localPositions.map { $0.applying(transform) }
    }

    public static func texCoords(
        for component: ChallengeMapLayoutComponent,
        resolvedUV: ChallengeMapResolvedUV?
    ) -> [CGPoint] {
        let pos = resolvedUV.map { SIMD2<Float>($0.u, $0.v) } ?? component.texCoordPos
        let size = resolvedUV.map { SIMD2<Float>($0.width, $0.height) } ?? component.texCoordSize
        let u = CGFloat(pos.x)
        let v = CGFloat(pos.y)
        let sizeX = CGFloat(size.x)
        let sizeY = CGFloat(size.y)
        return [
            CGPoint(x: u, y: v),
            CGPoint(x: u + sizeX, y: v),
            CGPoint(x: u + sizeX, y: v + sizeY),
            CGPoint(x: u, y: v + sizeY),
        ]
    }

    public static func quad(
        for component: ChallengeMapLayoutComponent,
        resolvedUV: ChallengeMapResolvedUV?,
        deviceWidth: CGFloat, deviceHeight: CGFloat
    ) -> ChallengeMapLayoutQuad {
        let positions = positions(for: component, deviceWidth: deviceWidth,
                                  deviceHeight: deviceHeight)
        let texCoords = texCoords(for: component, resolvedUV: resolvedUV)
        return ChallengeMapLayoutQuad(vertices: zip(positions, texCoords).map {
            ChallengeMapLayoutVertex(position: $0.0, texCoord: $0.1)
        })
    }
}
