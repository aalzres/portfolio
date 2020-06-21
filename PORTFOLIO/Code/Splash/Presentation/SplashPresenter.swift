//
//  SplashPresenter.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate on 15/06/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

protocol SplashPresenterOutput: class {}

protocol SplashPresenter {
    func goMainScreen()
}

class SplashPresenterImpl: SplashPresenter {
    private let router: SplashRouter
    private let interactor: Splash
    
    weak var output: SplashPresenterOutput?
    
    init(router: SplashRouter, interactor: Splash) {
        self.interactor = interactor
        self.router = router
    }
    
    func goMainScreen() {
        router.goMainScreen()
    }
}

extension SplashPresenterImpl: SplashOutput {}
