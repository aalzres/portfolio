//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 10/12/21.
//

import UIKit

public enum LinePosition {
    case top
    case bottom
}

extension UIView {
    @discardableResult
    public func addLine(position : LinePosition, color: UIColor = .darkGray, width: CGFloat = 1) -> Self {
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

        return self
    }
}
