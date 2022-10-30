//
//  CustomMapMiddleware.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 30/10/22.
//

import Combine
import Dispatch

protocol CustomMapMiddleware  {
    func redux(
        state: CustomMapState,
        action: CustomMapAction,
        queue: DispatchQueue
    ) -> AnyPublisher<CustomMapAction, Error>?
}
