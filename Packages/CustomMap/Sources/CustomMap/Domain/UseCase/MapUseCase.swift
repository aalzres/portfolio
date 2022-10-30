//
//  MapUseCase.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 30/10/22.
//

import Combine

public protocol MapUseCase {
    func getMapInfo(coordinates: Coordinates) -> AnyPublisher<EverythingMap, Error>
}

public final class MapUseCaseImpl: MapUseCase {
    private let everythingMapRepository: EveryThingMapRepository

    public init(
        everythingMapRepository: EveryThingMapRepository
    ) {
        self.everythingMapRepository = everythingMapRepository
    }

    public func getMapInfo(coordinates: Coordinates) -> AnyPublisher<EverythingMap, Error> {
        everythingMapRepository.get(params: .init(location: coordinates))
    }
}
