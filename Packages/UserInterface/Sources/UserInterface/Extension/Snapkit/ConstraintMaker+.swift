//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//

import SnapKit

extension ConstraintMaker {
    public var horizontal: ConstraintMakerExtendable { leading.trailing }
    public var vertical: ConstraintMakerExtendable { top.bottom }
}
