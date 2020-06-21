//
//  SplashRepository.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate on 15/06/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

protocol SplashRepositoryOutput: class {}

protocol SplashRepository {}

class SplashRepositoryImpl: SplashRepository {
    weak var output: SplashRepositoryOutput?
}
