//
//  Meep.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 16/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

protocol MeepOutput: class {
    
}

protocol Meep {
    
}

class MeepImpl: Meep {
    private let repository: MeepRepository
    
    weak var output: MeepOutput?
    
    init(repository: MeepRepository) {
        self.repository = repository
    }
}

extension MeepImpl: MeepRepositoryOutput {
    
}
