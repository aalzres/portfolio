//
//  CustomMapStore.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 29/10/22.
//

import Combine
import Dispatch
import Architecture

final class CustomMapStore: BaseStore, ObservableObject {
    private let containerDI: CustomMapContainerDI
    /// Pending to review: Publishing changes from background threads is not allowed; make sure to publish values from the main thread (via operators like receive(on:)) on model updates.
    @Published var state: CustomMapState
    private let reducer: CustomMapReducer
    private let middlewares: [CustomMapMiddleware]
    private let queue: DispatchQueue

    private var cancellables: Set<AnyCancellable> = .init()

    init(
        containerDI: CustomMapContainerDI,
        initialState state: CustomMapState
    ) {
        self.containerDI = containerDI
        self.state = state
        self.queue = DispatchQueue(label: "custom_map_store")
        self.reducer = CustomMapReducer(
            locationUseCase: containerDI.customMapDomainContainerDI.locationUseCase
        )
        self.middlewares = [
            CustomMapUserLocationMiddleware(
                locationUseCase: containerDI.customMapDomainContainerDI.locationUseCase
            )
        ]
    }

    func dispatch(action: CustomMapAction) {
        reducer.redux(state: &state, action: action)

        middlewares.forEach { middleware in
            guard let middleware = middleware.redux(state: state, action: action, queue: queue)
            else { return }
            middleware
                .receive(on: queue)
                .sink(receiveCompletion: { _ in }, receiveValue: dispatch)
                .store(in: &cancellables)
        }
    }
}
