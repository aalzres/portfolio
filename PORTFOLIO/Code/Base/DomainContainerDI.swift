//
//  DomainContainerDI.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 29/10/22.
//  Copyright © 2022 aalzres. All rights reserved.
//

import Utilities
import CoreLocation

protocol DomainContainerDI {
    var locationManagerUseCase: LocationManagerUseCase { get }
}

final class DomainContainerDIImpl: DomainContainerDI {
    lazy var locationManagerUseCase: LocationManagerUseCase = LocationManagerUseCaseImpl(
        coreLocationManager: CLLocationManager()
    )
}
