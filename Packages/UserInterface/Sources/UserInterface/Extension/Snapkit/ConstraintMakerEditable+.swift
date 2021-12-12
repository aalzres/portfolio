//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//

import SnapKit
import CoreGraphics

public extension ConstraintMakerEditable {
    @discardableResult
    func multipliedBy(_ amount: CGFloat) -> ConstraintMakerEditable {
        let amount: ConstraintMultiplierTarget = amount
        return multipliedBy(amount)
    }

    @discardableResult
    func offset(_ amount: CGFloat) -> ConstraintMakerEditable {
        let amount: ConstraintOffsetTarget = amount
        return offset(amount)
    }

    @discardableResult
    func inset(_ amount: CGFloat) -> ConstraintMakerEditable {
        let amount: ConstraintInsetTarget = amount
        return inset(amount)
    }
}
