//
//  ServicesLocator.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate on 15/06/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import UIKit
import Architecture

final class ServiceLocator {
    lazy var mainRouter: Router = {
        let window = UIApplication.shared.keyWindow
        return RouterImpl(window: window)
    }()
}
