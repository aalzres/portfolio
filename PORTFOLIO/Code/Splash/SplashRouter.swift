//
//  SplashRouter.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate on 15/06/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import UIKit

class SplashRouter {
    func goMainScreen() {
        let vc = MainScreenRouter.create()
        UIApplication.serviceLocator.mainRouter.set(vc: vc)
    }
    
    class func create() -> SplashVC {
        let serviceLocator = UIApplication.serviceLocator
        let networkManager = serviceLocator.networkManager
        
        let repository = SplashRepositoryImpl(networkManager: networkManager)
        let router = SplashRouter()
        let interactor = SplashImpl(repository: repository)
        let presenter = SplashPresenterImpl(router: router, interactor: interactor)
        interactor.output = presenter
        let vc = SplashVC(presenter: presenter)
        presenter.output = vc
        
        return vc
    }
}
