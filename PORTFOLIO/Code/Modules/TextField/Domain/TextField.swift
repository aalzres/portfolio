//
//  TextField.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 19/06/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

protocol TextFieldOutput: AnyObject {}

protocol TextField {}

class TextFieldImpl: TextField {
    private let repository: TextFieldRepository
    
    weak var output: TextFieldOutput?
    
    init(repository: TextFieldRepository) {
        self.repository = repository
    }
}

extension TextFieldImpl: TextFieldRepositoryOutput {}
