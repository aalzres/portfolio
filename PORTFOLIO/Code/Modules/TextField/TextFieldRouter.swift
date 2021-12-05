//
//  TextFieldRouter.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 19/06/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import UIKit

class TextFieldRouter {
    class func create() -> TextFieldVC {
        let repository = TextFieldRepositoryImpl()
        let router = TextFieldRouter()
        let interactor = TextFieldImpl(repository: repository)
        let presenter = TextFieldPresenterImpl(router: router, interactor: interactor)
        interactor.output = presenter
        let vc = TextFieldVC(presenter: presenter)
        presenter.output = vc
        
        return vc
    }
}
