//
//  MarvelRouter.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 10/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import UIKit

class MarvelRouter {
    class func create() -> MarvelVC {
        let serviceLocator = UIApplication.serviceLocator
        let networkManager = serviceLocator.networkManager
        
        let repository = MarvelRepositoryImpl(networkManager: networkManager)
        let router = MarvelRouter()
        let interactor = MarvelImpl(repository: repository)
        let presenter = MarvelPresenterImpl(router: router, interactor: interactor)
        repository.output = interactor
        interactor.output = presenter
        let vc = MarvelVC(presenter: presenter)
        presenter.output = vc
        
        return vc
    }
}
