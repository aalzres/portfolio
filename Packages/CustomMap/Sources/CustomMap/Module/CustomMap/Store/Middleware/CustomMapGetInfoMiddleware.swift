//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 30/10/22.
//

import Combine
import Dispatch
import Architecture

final class CustomMapGetInfoMiddleware: BaseMiddleware, CustomMapMiddleware {
    private let mapUseCase: MapUseCase

    init(
        mapUseCase: MapUseCase
    ) {
        self.mapUseCase = mapUseCase
    }

    func redux(
        state: CustomMapState,
        action: CustomMapAction,
        queue: DispatchQueue
    ) -> AnyPublisher<CustomMapAction, Error>? {
        guard case let .setCoordinates(userLocation) = action else { return nil }
        let coordinates = CoordinatesImpl(
            latitude: userLocation.latitude,
            longitude: userLocation.longitude
        )
        return mapUseCase.getMapInfo(coordinates: coordinates)
                .receive(on: queue)
                .map { .setMapInfo($0.mapElements) }
                .eraseToAnyPublisher()
    }
}
