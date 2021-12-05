//
//  MeepPresenter.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 16/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

protocol MeepPresenterOutput: AnyObject {
    func getResourcesSuccess(resourcesList: [ResourceEntity])
    func getResourcesFailure(_ error: String)
}

protocol MeepPresenter {
    func getResources(resourceParams: ResourceParamsEntity?)
}

class MeepPresenterImpl: MeepPresenter {
    private let router: MeepRouter
    private let interactor: Meep
    
    weak var output: MeepPresenterOutput?
    
    init(router: MeepRouter, interactor: Meep) {
        self.interactor = interactor
        self.router = router
    }
    
    func getResources(resourceParams: ResourceParamsEntity?) {
        interactor.getResources(resourceParams: resourceParams)
    }
}

extension MeepPresenterImpl: MeepOutput {
    func getResourcesSuccess(resourcesList: [ResourceEntity]) {
        output?.getResourcesSuccess(resourcesList: resourcesList)
    }
    
    func getResourcesFailure(error: NetworkErrorEntity) {
        output?.getResourcesFailure(error.errorDescription)
    }
}
