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
            locationUseCase.startLocation()

        case .onMapMoved:
            state = state.set(\.coordinates, String.random(ofLength: 10))

        case .onTapMap:
            break
        }
    }
}
