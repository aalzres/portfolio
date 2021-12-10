//
//  ServicesLocator.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate on 15/06/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import UIKit
import Architecture
import Data

final class ServiceLocator {
    lazy var mainRouter: Router = {
        let window = UIApplication.shared.keyWindow
        return RouterImpl(window: window)
    }()

    lazy var networkManager: NetworkManager = {
        return NetworkManagerImpl(appConfiguration: appConfiguration)
    }()

    lazy var appConfiguration: AppConfiguration = AppConfiguration()
}
