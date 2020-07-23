//
//  Meep.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 16/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

protocol MeepOutput: class {
    func getResourcesSuccess(resourcesList: [ResourceEntity])
    func getResourcesFailure(error: NetworkErrorEntity)
}

protocol Meep {
    func getResources(resourceParams: ResourceParamsEntity?)
}

class MeepImpl: Meep {
    private let repository: MeepRepository
    
    weak var output: MeepOutput?
    
    init(repository: MeepRepository) {
        self.repository = repository
    }
    
    func getResources(resourceParams: ResourceParamsEntity?) {
        repository.getResources(resourceParams: resourceParams)
    }
}

extension MeepImpl: MeepRepositoryOutput {
    func getResourcesSuccess(resourcesList: [ResourceEntity]) {
        output?.getResourcesSuccess(resourcesList: resourcesList)
    }
    
    func getResourcesFailure(error: NetworkErrorEntity) {
        output?.getResourcesFailure(error: error)
    }
}
