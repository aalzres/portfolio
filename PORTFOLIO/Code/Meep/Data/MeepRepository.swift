//
//  MeepRepository.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 16/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

protocol MeepRepositoryOutput: class {
    
}

protocol MeepRepository {
    
}

class MeepRepositoryImpl: MeepRepository {
    weak var output: MeepRepositoryOutput?
}
