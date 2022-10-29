//
//  DomainContainerDI.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 29/10/22.
//  Copyright © 2022 aalzres. All rights reserved.
//

import Utilities
import CustomMap
import CoreLocation

protocol DomainContainerDI {
    var locationUseCase: LocationUseCase { get }
}

final class DomainContainerDIImpl: DomainContainerDI {
    private lazy var locationManager: LocationManager = LocationManagerImpl(
        coreLocationManager: CLLocationManager()
    )

    lazy var locationUseCase: LocationUseCase = LocationUseCaseImpl(
        locationManager: locationManager
    )
}
