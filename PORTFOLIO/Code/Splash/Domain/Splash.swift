//
//  Splash.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate on 15/06/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

protocol SplashOutput: class {}

protocol Splash {}

class SplashImpl: Splash {
    private let repository: SplashRepository
    
    weak var output: SplashOutput?
    
    init(repository: SplashRepository) {
        self.repository = repository
    }
}

extension SplashImpl: SplashRepositoryOutput {}
