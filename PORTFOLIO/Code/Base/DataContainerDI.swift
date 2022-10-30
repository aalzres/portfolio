//
//  DataContainerDI.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 30/10/22.
//  Copyright © 2022 aalzres. All rights reserved.
//

import CustomMap
import UIKit

protocol DataContainerDI: CustomMapDataContainerDI { }

final class DataContainerDIImpl: DataContainerDI {
    private init() {}
    static let shared = DataContainerDIImpl()

    var everyThingMapApiService: EveryThingMapApiService = EveryThingMapApiServiceImpl(
        baseURL: UIApplication.serviceLocator.appConfiguration.serverHostCustomMap,
        version: UIApplication.serviceLocator.appConfiguration.serverApiVersionCustomMap,
        service: "everythingmap"
    )
}
