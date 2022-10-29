//
//  CustomMapCoordinator.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 29/10/22.
//

import Utilities
import Architecture

public protocol CustomMapCoordinator {
    /// Next navigation
}

public final class CustomMapCoordinatorImpl: BaseCoordinator, CustomMapCoordinator {
    public func present() {
        let state = CustomMapState()
        let reducer = CustomMapReducer()
        let store = CustomMapStore(
            initialState: state,
            reducer: reducer
        )
        let view = CustomMapView().environmentObject(store)
        router.push(vc: view.asViewController)
    }
}
