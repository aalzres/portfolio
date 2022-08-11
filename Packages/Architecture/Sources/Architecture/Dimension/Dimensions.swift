//
//  Dimensions.swift
//  FLComponents_Example
//
//  Created by Andres Felipe Alzate Restrepo on 8/8/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

public extension CGFloat {
    static let paddingXXXS: CGFloat = 2
    static let paddingXXS: CGFloat = 4
    static let paddingXS: CGFloat = 8
    static let paddingS: CGFloat = 16
    static let paddingM: CGFloat = 24
    static let paddingL: CGFloat = 32
    static let paddingLL: CGFloat = 48
    static let paddingXL: CGFloat = 64
    static let paddingXXL: CGFloat = 128
    static let paddingXXXL: CGFloat = 256

    /// Default button height
    static let buttonHeight: CGFloat = 48
    /// Default button height
    static let buttonCornerRadius: CGFloat = 8

// MARK: - Font
    static let title: CGFloat = 28
    static let subtitle: CGFloat = 18
    static let primary: CGFloat = 16
    static let secondary: CGFloat = 14

    /// Shadow radius by default
    static let shadowRadius: CGFloat = 2
    /// Corner radius by default
    static let cornerRadius: CGFloat = 2
}

// MARK: - Type of line
extension Int {
    /// Value: 0
    public static let unlimitedLines = 0
    /// Value: 1
    public static let oneLine = 1
    /// Value: 2
    public static let twoLine = 2
}

public extension TimeInterval {
    /// Animation duration by default
    static let animationDuration: TimeInterval = 2
}
