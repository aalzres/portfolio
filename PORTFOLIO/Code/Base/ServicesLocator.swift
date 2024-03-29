//
//  ServicesLocator.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate on 15/06/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import UIKit

import Data
import Architecture

extension UIApplication {
    static var serviceLocator: ServiceLocator { ServiceLocator.shared }
}

final class ServiceLocator {
    private init() {}
    static let shared = ServiceLocator()

    lazy var mainRouter: Router = {
        let window = UIApplication.shared.keyWindow
        return RouterImpl(window: window)
    }()

    lazy var networkManager: NetworkManager = {
        return NetworkManagerImpl(appConfiguration: appConfiguration)
    }()

    let appConfiguration = AppConfiguration()

    lazy var containerDI: ContainerDI = ContainerDIImpl.shared
}
