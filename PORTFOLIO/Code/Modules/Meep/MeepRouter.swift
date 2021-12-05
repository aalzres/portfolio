//
//  MeepRouter.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 16/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import UIKit

class MeepRouter {
    class func create() -> MeepVC {
        let serviceLocator = UIApplication.serviceLocator
        let networkManager = serviceLocator.networkManager
        
        let repository = MeepRepositoryImpl(networkManager: networkManager)
        let router = MeepRouter()
        let interactor = MeepImpl(repository: repository)
        let presenter = MeepPresenterImpl(router: router, interactor: interactor)
        repository.output = interactor
        interactor.output = presenter
        let vc = MeepVC(presenter: presenter)
        presenter.output = vc
        
        return vc
    }
}
