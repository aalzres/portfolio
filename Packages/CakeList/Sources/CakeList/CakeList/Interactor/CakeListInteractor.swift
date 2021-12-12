//
//  CakeListInteractor.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

import Action
import Domain
import Architecture

protocol CakeListInteractor {
    var getCakeListItem: Action<Void, [CakeItem]> { get }
}

final class CakeListInteractorImpl: BaseInteractor, CakeListInteractor {
    private let cakeListUseCase: CakeListUseCase

    init(
        cakeListUseCase: CakeListUseCase
    ) {
        self.cakeListUseCase = cakeListUseCase
    }

    lazy var getCakeListItem: Action<Void, [CakeItem]> = .init(workFactory: { [unowned self] in
        self.cakeListUseCase.getCakeListItem().mapResult()
    })
}
