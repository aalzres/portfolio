//
//  EveryThingMapApiService.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 30/10/22.
//

import Combine
import Utilities

public protocol EveryThingMapApiService {
    func get(params: EveryThingGetMapInfoParams) -> AnyPublisher<EverythingMapResponse, Error>
}

public final class EveryThingMapApiServiceImpl: BaseApiService, EveryThingMapApiService {
    public func get(params: EveryThingGetMapInfoParams) -> AnyPublisher<EverythingMapResponse, Error> {
        getDataTaskPublisher(params: params)
    }
}
