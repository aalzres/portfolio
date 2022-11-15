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
        case .onAppear:
            state = state
                .set(\.mapState.userLocationEnable, true)

        case let .setCoordinates(coordinates):
            state = state
                .set(\.mapState.userLocation, CustomMapCoordinates(coordinates))
                .set(\.mapState.zoom, 15)

        case let .setMapInfo(mapInfo):
            state = state
                .set(\.mapState.markers, mapInfo.map(MarkerInfo.init))

        default: break
        }
    }
}
