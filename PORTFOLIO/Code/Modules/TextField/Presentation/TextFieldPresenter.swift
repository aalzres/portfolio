//
//  TextFieldPresenter.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 19/06/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Architecture

protocol TextFieldPresenterOutput: AnyObject {}

protocol TextFieldPresenter {}

class TextFieldPresenterImpl: BasePresenter, TextFieldPresenter {
    private let router: TextFieldRouter
    private let interactor: TextField
    
    weak var output: TextFieldPresenterOutput?
    
    init(router: TextFieldRouter, interactor: TextField) {
        self.interactor = interactor
        self.router = router
    }
}

extension TextFieldPresenterImpl: TextFieldOutput {}
