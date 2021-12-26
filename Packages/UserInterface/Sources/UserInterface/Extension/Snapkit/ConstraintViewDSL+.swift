//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 26/12/21.
//

import SnapKit

public extension ConstraintViewDSL {
    func makeConstraintsToSuperView() {
        self.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
