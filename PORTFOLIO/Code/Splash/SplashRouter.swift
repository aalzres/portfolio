//
//  SplashRouter.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate on 15/06/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

class SplashRouter {
    class func create() -> SplashVC {
        let repository = SplashRepositoryImpl()
        let router = SplashRouter()
        let interactor = SplashImpl(repository: repository)
        let presenter = SplashPresenterImpl(router: router, interactor: interactor)
        interactor.output = presenter
        let vc = SplashVC(presenter: presenter)
        presenter.output = vc
        
        return vc
    }
}
