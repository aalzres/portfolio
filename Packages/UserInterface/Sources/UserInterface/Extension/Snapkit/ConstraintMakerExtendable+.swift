//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 25/12/21.
//

import SnapKit

extension ConstraintMakerExtendable {
    public var horizontal: ConstraintMakerExtendable { leading.trailing }
    public var vertical: ConstraintMakerExtendable { top.bottom }
}
