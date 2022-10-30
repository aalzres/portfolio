//
//  CustomMapUserLocationMiddleware.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 30/10/22.
//

import Combine
import Dispatch

import Architecture

final class CustomMapUserLocationMiddleware: BaseMiddleware, CustomMapMiddleware {
    private let locationUseCase: LocationUseCase

    init(
        locationUseCase: LocationUseCase
    ) {
        self.locationUseCase = locationUseCase
    }

    func redux(
        state: CustomMapState,
        action: CustomMapAction,
        queue: DispatchQueue
    ) -> AnyPublisher<CustomMapAction, Error>? {
        guard case .getUserLocation = action else { return nil }
        locationUseCase.startLocation()
            return locationUseCase.didUpdateLastLocation
                .receive(on: queue)
                .map { .set(coordinates: $0) }
                .eraseToAnyPublisher()
    }
}
