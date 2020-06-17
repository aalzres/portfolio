//
//  MainScreenRepository.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate on 16/06/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

protocol MainScreenRepositoryOutput: class {
    
}

protocol MainScreenRepository {
    
}

class MainScreenRepositoryImpl: MainScreenRepository {
    weak var output: MainScreenRepositoryOutput?
}
