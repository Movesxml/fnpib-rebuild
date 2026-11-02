import Foundation

extension UIScreenLayoutProjection {
    /// Applies the common root scale once. Local and logical values are unchanged.
    public static func projectDevicePixels(
        _ player: UIScreenAnimationPlayer,
        viewport: UIScreenRootViewport
    ) throws -> UIScreenLayoutProjection {
        let logical = try project(player)
        let rootMatrix = viewport.rootScaleMatrix

        let components = logical.components.map { component in
            UIScreenProjectedComponent(
                name: component.name,
                index: component.index,
                parentIndex: component.parentIndex,
                position: component.position,
                scale: component.scale,
                rotation: component.rotation,
                width: component.width,
                height: component.height,
                origin: component.origin,
                originFromCenter: component.originFromCenter,
                effectiveOrigin: component.effectiveOrigin,
                localMatrix: component.localMatrix,
                worldMatrix: rootMatrix * component.worldMatrix,
                worldOrigin: rootMatrix.transformed(component.worldOrigin),
                worldCorners: UIScreenProjectedCorners(
                    minimumXMinimumY: rootMatrix.transformed(
                        component.worldCorners.minimumXMinimumY),
                    maximumXMinimumY: rootMatrix.transformed(
                        component.worldCorners.maximumXMinimumY),
                    maximumXMaximumY: rootMatrix.transformed(
                        component.worldCorners.maximumXMaximumY),
                    minimumXMaximumY: rootMatrix.transformed(
                        component.worldCorners.minimumXMaximumY)))
        }

        return UIScreenLayoutProjection(components: components)
    }

    public static func projectDevicePixels(
        _ player: UIScreenAnimationPlayer,
        deviceWidth: Float,
        deviceHeight: Float,
        designWidth: Float = UIScreenRootViewport.iPhoneDesignWidth,
        designHeight: Float = UIScreenRootViewport.iPhoneDesignHeight,
        scaleToViewportMode: UIScreenViewportScaleMode = .scale
    ) throws -> UIScreenLayoutProjection {
        let viewport = try UIScreenRootViewport(
            deviceWidth: deviceWidth,
            deviceHeight: deviceHeight,
            designWidth: designWidth,
            designHeight: designHeight,
            scaleToViewportMode: scaleToViewportMode)
        return try projectDevicePixels(player, viewport: viewport)
    }
}
