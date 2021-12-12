//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//

import UIKit
import CoreGraphics

public extension UIView {
    var shadowColor: CGColor? {
        get { layer.shadowColor }
        set { layer.shadowColor = newValue }
    }
    var shadowOffset: CGSize {
        get { layer.shadowOffset }
        set { layer.shadowOffset = newValue }
    }
    var shadowRadius: CGFloat {
        get { layer.shadowRadius }
        set { layer.shadowRadius = newValue }
    }
    var shadowOpacity: Float {
        get { layer.shadowOpacity }
        set { layer.shadowOpacity = newValue }
    }
    var masksToBounds: Bool {
        get { layer.masksToBounds }
        set { layer.masksToBounds = newValue }
    }
    var isShadow: Bool {
        get { shadowStatus }
        set { newValue ? showShadow : hideShadow }
    }
    private var shadowStatus: Bool {
        shadowColor != nil &&
        shadowRadius != 0 &&
        shadowOpacity != 0 &&
        !masksToBounds
    }
    private var showShadow: Void {
        shadowColor = shadowColor ?? .shadowColorByDefault
        shadowRadius = shadowRadius == .shadowRadiusDefaultByApple ? .shadowRadiusByDefault : shadowRadius
        shadowOpacity = shadowOpacity == 0 ? .shadowOpacityByDefault : shadowOpacity
        masksToBounds = false
        shadowOffset = .shadowOffsetByDefault
    }
    private var hideShadow: Void {
        shadowColor = nil
        shadowRadius = 0
        shadowOpacity = 0
        masksToBounds = true
    }
}
private extension CGColor {
    static let shadowColorByDefault = UIColor.black.cgColor
}
private extension CGSize {
    static let shadowOffsetByDefault: CGSize = .zero
}
private extension CGFloat {
    static let shadowRadiusByDefault = 4.cgFloat
    /// https://developer.apple.com/documentation/quartzcore/calayer/1410819-shadowradius
    static let shadowRadiusDefaultByApple = 3.cgFloat
}
private extension Float {
    static let shadowOpacityByDefault = 0.1.float
}
