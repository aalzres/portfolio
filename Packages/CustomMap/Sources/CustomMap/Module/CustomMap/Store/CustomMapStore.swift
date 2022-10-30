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
    private let reducer: CustomMapReducer
    private let middlewares: [CustomMapMiddleware]
    private var cancellables: Set<AnyCancellable> = .init()
    private let queue: DispatchQueue

    @Published var state: CustomMapState

    init(
        containerDI: CustomMapContainerDI,
        initialState state: CustomMapState
    ) {
        self.containerDI = containerDI
        self.state = state
        self.queue = DispatchQueue.main
        self.reducer = CustomMapReducer(
            locationUseCase: containerDI.customMapDomainContainerDI.locationUseCase
        )
        self.middlewares = [
            CustomMapUserLocationMiddleware(
                locationUseCase: containerDI.customMapDomainContainerDI.locationUseCase
            ),
            CustomMapGetInfoMiddleware(
                mapUseCase: containerDI.customMapDomainContainerDI.mapUseCase
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
