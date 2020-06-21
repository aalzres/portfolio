//
//  TextFieldRepository.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 19/06/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

protocol TextFieldRepositoryOutput: class {}

protocol TextFieldRepository {}

class TextFieldRepositoryImpl: TextFieldRepository {
    weak var output: TextFieldRepositoryOutput?
}
