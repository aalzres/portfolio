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
    private let containerDI: CustomMapContainerDI

    public init(
        router: Router,
        containerDI: CustomMapContainerDI
    ) {
        self.containerDI = containerDI
        super.init(router: router)
    }

    public func present() {
        let state = CustomMapState()
        let reducer = CustomMapReducer(
            locationUseCase: containerDI.customMapDomainContainerDI.locationUseCase
        )
        let store = CustomMapStore(
            initialState: state,
            reducer: reducer
        )
        let view = CustomMapView().environmentObject(store)
        router.push(vc: view.asViewController)
    }
}
