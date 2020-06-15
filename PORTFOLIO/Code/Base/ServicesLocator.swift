//
//  ServicesLocator.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate on 15/06/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import UIKit

final class ServiceLocator {
    lazy var mainRouter: MainRouter = {
        let window = UIApplication.shared.keyWindow
        return MainRouterImpl(window: window)
    }()
}
