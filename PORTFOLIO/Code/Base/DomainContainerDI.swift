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

protocol DomainContainerDI: CustomMapDomainContainerDI { }

final class DomainContainerDIImpl: DomainContainerDI {
    private init() {}
    static let shared = DomainContainerDIImpl()

    private lazy var locationManager: LocationManager = LocationManagerImpl(
        coreLocationManager: CLLocationManager()
    )
    lazy var locationUseCase: LocationUseCase = LocationUseCaseImpl(
        locationManager: locationManager
    )

    private lazy var everythingMapRepository: EveryThingMapRepository = EveryThingMapRepositoryImpl(
        everyThingMapApiService: DataContainerDIImpl.shared.everyThingMapApiService
    )
    lazy var mapUseCase: MapUseCase = MapUseCaseImpl(
        everythingMapRepository: everythingMapRepository
    )
}
