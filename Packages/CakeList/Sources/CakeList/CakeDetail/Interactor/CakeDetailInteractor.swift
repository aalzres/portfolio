//
//  CakeDetailInteractor.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 24/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

import Action

import Domain
import Architecture

protocol CakeDetailInteractor {
    var getCakeItem: Action<Void, CakeItem> { get }
}

final class CakeDetailInteractorImpl: BaseInteractor, CakeDetailInteractor {
    private let cakeItem: CakeItem

    init(
        cakeItem: CakeItem
    ) {
        self.cakeItem = cakeItem
    }

    lazy var getCakeItem: Action<Void, CakeItem> = .init(workFactory: { [unowned self] in
            .just(self.cakeItem)
    })
}
