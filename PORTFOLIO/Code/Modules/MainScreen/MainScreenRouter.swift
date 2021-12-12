//
//  MainScreenRouter.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate on 16/06/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import UIKit
import CakeList
import Domain
import DomainMock

class MainScreenRouter {
    func goTextFieldVC() {
        let vc = TextFieldRouter.create()
        UIApplication.serviceLocator.mainRouter.push(vc: vc)
    }
    
    func goMarvel() {
        let vc = MarvelRouter.create()
        UIApplication.serviceLocator.mainRouter.push(vc: vc)
    }
    
    func goMapKit() {
        let vc = MeepRouter.create()
        UIApplication.serviceLocator.mainRouter.push(vc: vc)
    }

    func goCakeList() {
        let useCase = CakeListUseCaseMock(.success)
//        let useCase = CakeListUseCaseMock(.failure)
//        let useCase = CakeListUseCaseMock(.isEmpty)

        ModuleCakeCoordinatorImpl(
            router: UIApplication.serviceLocator.mainRouter,
            cakeListUseCase: useCase
        ).present(animated: true)
    }

    class func create() -> MainScreenVC {
        let repository = MainScreenRepositoryImpl()
        let router = MainScreenRouter()
        let interactor = MainScreenImpl(repository: repository)
        let presenter = MainScreenPresenterImpl(router: router, interactor: interactor)
        interactor.output = presenter
        let vc = MainScreenVC(presenter: presenter)
        presenter.output = vc
        
        return vc
    }
}
