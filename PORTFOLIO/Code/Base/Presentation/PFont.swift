//
//  PFont.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 24/06/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import UIKit

struct PFont {
    static let title: UIFont = .robotoLight(PDimen.title)
    static let subtitle: UIFont = .robotoLight(PDimen.subtitle)
    static let primary: UIFont = .robotoLight(PDimen.primary)
    static let secondary: UIFont = .robotoLight(PDimen.secondary)
    static let inputPrimary: UIFont = .robotoRegular(PDimen.primary)
    static let inputSecondary: UIFont = .robotoLight(PDimen.secondary)
}

extension UIFont {
    class func robotoBlack(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Black", size: size)!
    }
    
    class func robotoBlackItalic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-BlackItalic", size: size)!
    }
    
    class func robotoBold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Bold", size: size)!
    }
    
    class func robotoBoldItalic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-BoldItalic", size: size)!
    }
    
    class func robotoItalic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Italic", size: size)!
    }
    
    class func robotoLight(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Light", size: size)!
    }
    
    class func robotoLightItalic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-LightItalic", size: size)!
    }
    
    class func robotoMedium(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Medium", size: size)!
    }
    
    class func robotoMediumItalic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-MediumItalic", size: size)!
    }
    
    class func robotoRegular(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Regular", size: size)!
    }
    
    class func robotoThin(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Thin", size: size)!
    }
    
    class func robotoThinItalic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-ThinItalic", size: size)!
    }
}
