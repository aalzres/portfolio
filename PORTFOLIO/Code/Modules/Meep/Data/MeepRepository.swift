//
//  MeepRepository.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 16/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Domain
import Data

import Alamofire

public protocol MeepRepositoryOutput: AnyObject {
    func getResourcesSuccess(resourcesList: [ResourceEntity])
    func getResourcesFailure(error: NetworkErrorEntity)
}

public protocol MeepRepository {
    func getResources(resourceParams: ResourceParamsEntity?)
}

public class MeepRepositoryImpl: MeepRepository {
    weak var output: MeepRepositoryOutput?
    
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    public func getResources(resourceParams: ResourceParamsEntity?) {
        let operation = ResourcesOperation(resourceParams: resourceParams, completionSuccess: { [weak self] resourcesList in
            guard let resourcesList = resourcesList as? [ResourceEntity]  else {
                self?.output?.getResourcesFailure(error: .wrongDataError)
                return
            }
            self?.output?.getResourcesSuccess(resourcesList: resourcesList)
            }, completionFailure: { [weak self] error in
                self?.output?.getResourcesFailure(error: error)
        })
        networkManager.request(operation)
    }
}
