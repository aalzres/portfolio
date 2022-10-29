//
//  CustomMapStore.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 29/10/22.
//

import Combine

final class CustomMapStore: ObservableObject {
    @Published private(set) var state: CustomMapState
    private let reducer: CustomMapReducer

    init(
        initialState state: CustomMapState,
        reducer: CustomMapReducer
    ) {
        self.state = state
        self.reducer = reducer
    }

    func dispatch(action: CustomMapAction) {
        reducer.redux(state: &state, action: action)
    }
}
