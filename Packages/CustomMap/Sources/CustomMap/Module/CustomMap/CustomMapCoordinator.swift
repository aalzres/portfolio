//
//  CustomMapCoordinator.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 29/10/22.
//

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
        let store = CustomMapStore(
            containerDI: containerDI,
            initialState: state
        )
        let view = CustomMapView(
            store: store
        )
        router.push(vc: view.asViewController)
    }
}
