//
//  MeepPresenter.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 16/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

protocol MeepPresenterOutput: class {

}

protocol MeepPresenter {

}

class MeepPresenterImpl: MeepPresenter {
    private let router: MeepRouter
    private let interactor: Meep
    
    weak var output: MeepPresenterOutput?
    
    init(router: MeepRouter, interactor: Meep) {
        self.interactor = interactor
        self.router = router
    }
}

extension MeepPresenterImpl: MeepOutput {

}
