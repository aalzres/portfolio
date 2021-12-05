//
//  MainScreen.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate on 16/06/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

protocol MainScreenOutput: AnyObject {}

protocol MainScreen {}

class MainScreenImpl: MainScreen {
    private let repository: MainScreenRepository
    
    weak var output: MainScreenOutput?
    
    init(repository: MainScreenRepository) {
        self.repository = repository
    }
}

extension MainScreenImpl: MainScreenRepositoryOutput {}
