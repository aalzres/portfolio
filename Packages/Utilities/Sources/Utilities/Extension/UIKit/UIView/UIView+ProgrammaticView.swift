//
//  UIView+ProgrammaticView.swift
//  Utilities
//
//  Created by Andres Felipe Alzate on 17/06/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import UIKit

extension UIView {
    public func anchor(
        _ parent:UIView,
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
        height: NSLayoutDimension? = nil
    ) {
        anchor(
            parent,
            top: top,
            paddingTop: paddingTop,
            bottom: bottom,
            paddingBottom: paddingBottom,
            leading: leading,
            paddingLeading: paddingLeading,
            trailing: trailing,
            paddingTrailing: paddingTrailing
        )
        if let width = widthConstant    { widthAnchor.constraint(equalToConstant: width).isActive = true }
        if let height = heightConstant  { heightAnchor.constraint(equalToConstant: height).isActive = true }
        if let width = width            { widthAnchor.constraint(equalTo: width).isActive = true }
        if let height = height          { heightAnchor.constraint(equalTo: height).isActive = true }
        if let centerX = centerX        { centerXAnchor.constraint(equalTo: centerX).isActive = true }
        if let centerY = centerY        { centerYAnchor.constraint(equalTo: centerY).isActive = true }
    }
    
    public func anchor(
        _ parent:UIView,
        top: NSLayoutYAxisAnchor? = nil,
        paddingTop: CGFloat = 0,
        bottom: NSLayoutYAxisAnchor? = nil,
        paddingBottom: CGFloat = 0,
        leading: NSLayoutXAxisAnchor? = nil,
        paddingLeading: CGFloat = 0,
        trailing: NSLayoutXAxisAnchor? = nil,
        paddingTrailing: CGFloat = 0
    ) {
        parent.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top            { topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true }
        if let bottom = bottom      { bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true }
        if let leading = leading    { leadingAnchor.constraint(equalTo: leading, constant: paddingLeading).isActive = true }
        if let trailing = trailing  { trailingAnchor.constraint(equalTo: trailing, constant: paddingTrailing).isActive = true }
    }
}
