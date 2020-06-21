//
//  UIView+Extension.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate on 17/06/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import UIKit

enum LinePosition {
    case top
    case bottom
}

extension UIView {
    func addNeumorphismStyle(colorLight: UIColor,
                             colorDark: UIColor,
                             shadowRadius: CGFloat = PDimen.shadowRadius,
                             cornerRadius: CGFloat = PDimen.cornerRadius) {
        self.layoutIfNeeded()
        let shadowWhite = CALayer()
        shadowWhite.frame = self.bounds
        shadowWhite.backgroundColor = colorLight.cgColor
        shadowWhite.cornerRadius = cornerRadius
        shadowWhite.shadowColor = PColor.white.cgColor
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
    
    func anchor(_ parent:UIView,
                top: NSLayoutYAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                bottom: NSLayoutYAxisAnchor? = nil,
                paddingBottom: CGFloat = 0,
                leading: NSLayoutXAxisAnchor? = nil,
                paddingLeading: CGFloat = 0,
                trailing: NSLayoutXAxisAnchor? = nil,
                paddingTrailing: CGFloat = 0,
                centerX: NSLayoutXAxisAnchor? = nil,
                centerY: NSLayoutYAxisAnchor? = nil,
                widthConstant: CGFloat? = nil,
                heightConstant: CGFloat? = nil,
                width: NSLayoutDimension? = nil,
                height: NSLayoutDimension? = nil) {
        anchor(parent,
               top: top,
               paddingTop: paddingTop,
               bottom: bottom,
               paddingBottom: paddingBottom,
               leading: leading,
               paddingLeading: paddingLeading,
               trailing: trailing,
               paddingTrailing: paddingTrailing)
        if let width = widthConstant    { widthAnchor.constraint(equalToConstant: width).isActive = true }
        if let height = heightConstant  { heightAnchor.constraint(equalToConstant: height).isActive = true }
        if let width = width            { widthAnchor.constraint(equalTo: width).isActive = true }
        if let height = height          { heightAnchor.constraint(equalTo: height).isActive = true }
        if let centerX = centerX        { centerXAnchor.constraint(equalTo: centerX).isActive = true }
        if let centerY = centerY        { centerYAnchor.constraint(equalTo: centerY).isActive = true }
    }
    
    func anchor(_ parent:UIView,
                top: NSLayoutYAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                bottom: NSLayoutYAxisAnchor? = nil,
                paddingBottom: CGFloat = 0,
                leading: NSLayoutXAxisAnchor? = nil,
                paddingLeading: CGFloat = 0,
                trailing: NSLayoutXAxisAnchor? = nil,
                paddingTrailing: CGFloat = 0) {
        parent.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top            { topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true }
        if let bottom = bottom      { bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true }
        if let leading = leading    { leadingAnchor.constraint(equalTo: leading, constant: paddingLeading).isActive = true }
        if let trailing = trailing  { trailingAnchor.constraint(equalTo: trailing, constant: paddingTrailing).isActive = true }
    }
    
    func addGradientLayer() {
        let layer = CAGradientLayer()
        layer.frame = self.bounds
        layer.colors = [PColor.grayL.cgColor, PColor.grayM.cgColor]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 1, y: 1)
        self.layer.addSublayer(layer)
    }
    
    func addLine(position : LinePosition, color: UIColor = PColor.lineColor, width: CGFloat = PDimen.underlineWidth) {
        let lineView = UIView()
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.backgroundColor = color
        
        addSubview(lineView)
        
        let metrics = ["width" : width]
        let views = ["lineView" : lineView]
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[lineView]|", options: [], metrics: metrics, views: views))
        
        switch position {
        case .top:
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lineView(width)]", options: [], metrics: metrics, views: views))
            break
        case .bottom:
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[lineView(width)]|", options: [], metrics: metrics, views: views))
            break
        }
    }
}
