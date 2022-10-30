//
//  CustomMapReducer.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 29/10/22.
//

import Combine
import Architecture

final class CustomMapReducer: BaseReducer {
    private let locationUseCase: LocationUseCase

    init(
        locationUseCase: LocationUseCase
    ) {
        self.locationUseCase = locationUseCase
    }

    func redux(
        state: inout CustomMapState,
        action: CustomMapAction
    ) {
        switch action {
        case .getUserLocation:
            state = state
                .set(\.mapState.userLocationEnable, true)

        case let .set(coordinates):
            let userLocation = CustomMapCoordinates(
                latitude: coordinates.latitude,
                longitude: coordinates.longitude
            )
            state = state
                .set(\.mapState.userLocation, userLocation)
                .set(\.mapState.zoom, 15)
        }
    }
}
