//
//  UIView+sizeSelfToFit.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 28/10/22.
//

import UIKit

extension UIView {
    @discardableResult
    public func sizeSelfToFit() -> Self {
        sizeToFit()
        return self
    }
}
