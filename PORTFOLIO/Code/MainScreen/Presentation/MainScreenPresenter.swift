//
//  MainScreenPresenter.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate on 16/06/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

protocol MainScreenPresenterOutput: class {}

protocol MainScreenPresenter {
    func goTextFieldVC()
    func goMarvel()
}

class MainScreenPresenterImpl: MainScreenPresenter {
    private let router: MainScreenRouter
    private let interactor: MainScreen
    
    weak var output: MainScreenPresenterOutput?
    
    init(router: MainScreenRouter, interactor: MainScreen) {
        self.interactor = interactor
        self.router = router
    }
    
    func goTextFieldVC() {
        router.goTextFieldVC()
    }
    
    func goMarvel() {
        router.goMarvel()
    }
}

extension MainScreenPresenterImpl: MainScreenOutput {}
