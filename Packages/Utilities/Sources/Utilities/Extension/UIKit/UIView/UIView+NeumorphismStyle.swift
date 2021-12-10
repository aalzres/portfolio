//
//  UIView+NeumorphismStyle.swift
//  Utilities
//
//  Created by Andres Felipe Alzate Restrepo on 10/12/21.
//

import UIKit

extension UIView {
    public func addNeumorphismStyle(colorLight: UIColor,
                             colorDark: UIColor,
                             shadowRadius: CGFloat = 2,
                             cornerRadius: CGFloat = 2) {
        self.layoutIfNeeded()
        let shadowWhite = CALayer()
        shadowWhite.frame = self.bounds
        shadowWhite.backgroundColor = colorLight.cgColor
        shadowWhite.cornerRadius = cornerRadius
        shadowWhite.shadowColor = UIColor.white.cgColor
        shadowWhite.shadowOffset = CGSize(width: -shadowRadius, height: -shadowRadius)
        shadowWhite.shadowOpacity = 1
        shadowWhite.shadowRadius = shadowRadius
        self.layer.insertSublayer(shadowWhite, at: 0)

        let shadowDark = CALayer()
        shadowDark.frame = self.bounds
        shadowDark.backgroundColor = colorLight.cgColor
        shadowDark.cornerRadius = cornerRadius
        shadowDark.shadowColor = colorDark.cgColor
        shadowDark.shadowOffset = CGSize(width: shadowRadius, height: shadowRadius)
        shadowDark.shadowOpacity = 1
        shadowDark.shadowRadius = shadowRadius
        self.layer.insertSublayer(shadowDark, at: 0)
    }
}
