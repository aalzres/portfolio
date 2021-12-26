//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 26/12/21.
//

import SnapKit
import CoreGraphics

public extension ConstraintMakerRelatable {
    @discardableResult
    func equalTo(_ other: CGFloat) -> ConstraintMakerEditable {
        let other: ConstraintRelatableTarget = other
        return equalTo(other)
    }
    @discardableResult
    func greaterThanOrEqualTo(_ other: CGFloat) -> ConstraintMakerEditable {
        let other: ConstraintRelatableTarget = other
        return greaterThanOrEqualTo(other)
    }
    @discardableResult
    func lessThanOrEqualTo(_ other: CGFloat) -> ConstraintMakerEditable {
        let other: ConstraintRelatableTarget = other
        return lessThanOrEqualTo(other)
    }
}
