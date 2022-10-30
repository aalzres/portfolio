//
//  EveryThingMapRepository.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 30/10/22.
//

import Combine

public protocol EveryThingMapRepository {
    func get(params: EveryThingGetMapInfoParams) -> AnyPublisher<EverythingMap, Error>
}

public final class EveryThingMapRepositoryImpl: EveryThingMapRepository {
    /// ApiService
    private let everyThingMapApiService: EveryThingMapApiService
    /// CoreDate
    /// private let everyThingMapCoreDate: EveryThingMapCoreDate

    public init(
        everyThingMapApiService: EveryThingMapApiService
    ) {
        self.everyThingMapApiService = everyThingMapApiService
    }

    public func get(params: EveryThingGetMapInfoParams) -> AnyPublisher<EverythingMap, Error> {
        /// Depends on the logic business we will use The Core Data, The Api Service or more.
        everyThingMapApiService.get(params: params)
            .compactMap(EverythingMapImpl.init)
            .eraseToAnyPublisher()
    }
}
