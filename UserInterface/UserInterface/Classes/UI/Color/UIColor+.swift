//
//  UIColor+.swift
//  FLComponents
//
//  Created by Andres Felipe Alzate Restrepo on 8/8/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

public extension UIColor {
    static var background: UIColor? { ColorPalette.background.uiColor }
    static var dark: UIColor? { ColorPalette.dark.uiColor }
    static var dark10: UIColor? { ColorPalette.dark.uiColor(.tone10) }
    static var dark30: UIColor? { ColorPalette.dark.uiColor(.tone30) }
    static var error: UIColor? { ColorPalette.error.uiColor }
    static var errorTone25: UIColor? { ColorPalette.error.uiColor(.tone25) }
    static var errorTone75: UIColor? { ColorPalette.error.uiColor(.tone75) }
    static var information: UIColor? { ColorPalette.information.uiColor }
    static var informationTone25: UIColor? { ColorPalette.information.uiColor(.tone25) }
    static var informationTone75: UIColor? { ColorPalette.information.uiColor(.tone75) }
    static var light: UIColor? { ColorPalette.light.uiColor }
    static var first: UIColor? { ColorPalette.first.uiColor }
    static var second: UIColor? { ColorPalette.second.uiColor }
    static var success: UIColor? { ColorPalette.success.uiColor }
    static var successTone25: UIColor? { ColorPalette.success.uiColor(.tone25) }
    static var successTone75: UIColor? { ColorPalette.success.uiColor(.tone75) }
    static var text: UIColor? { ColorPalette.text.uiColor }
    static var textDark: UIColor? { ColorPalette.text.uiColor(.dark)}
    static var textLight: UIColor? { ColorPalette.text.uiColor(.light) }
    static var warning: UIColor? { ColorPalette.warning.uiColor }
    static var warningTone25: UIColor? { ColorPalette.warning.uiColor(.tone25) }
    static var warningTone75: UIColor? { ColorPalette.warning.uiColor(.tone75) }
}

private extension ColorPalette {
    var uiColor: UIColor? {
        .init(named: rawValue)
    }
    
    func uiColor(_ tone: Tone) -> UIColor? {
        .init(named: rawValue + "_" + tone.rawValue)
    }
}
