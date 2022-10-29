//
//  CustomMapReducer.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 29/10/22.
//

final class CustomMapReducer {
    func redux(
        state: inout CustomMapState,
        action: CustomMapAction
    ) {
        switch action {
        case .onMapMoved:
            state = state.set(\.coordinates, String.random(ofLength: 10))

        case .onTapMap:
            break
        }
    }
}
