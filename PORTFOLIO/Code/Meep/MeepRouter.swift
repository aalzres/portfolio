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
        let repository = MeepRepositoryImpl()
        let router = MeepRouter()
        let interactor = MeepImpl(repository: repository)
        let presenter = MeepPresenterImpl(router: router, interactor: interactor)
        interactor.output = presenter
        let vc = MeepVC(presenter: presenter)
        presenter.output = vc
        
        return vc
    }
}
