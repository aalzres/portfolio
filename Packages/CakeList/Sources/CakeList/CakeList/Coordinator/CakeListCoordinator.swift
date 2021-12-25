//
//  CakeListCoordinator.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

import UIKit

import Domain
import Architecture

protocol CakeListCoordinator {
    func navigateToCakeDetail(cakeItem: CakeItem)
}

final class CakeListCoordinatorImpl: BaseCoordinator, CakeListCoordinator {
    private weak var viewController: UIViewController?
    private let cakeListUseCase: CakeListUseCase

    public init(
        router: Router,
        cakeListUseCase: CakeListUseCase
    ) {
        self.cakeListUseCase = cakeListUseCase
        super.init(router: router)
    }

    public func present() {
        let interactor = CakeListInteractorImpl(
            cakeListUseCase: cakeListUseCase
        )

        let commander = CakeListCommanderImpl(
            coordinator: self,
            interactor: interactor
        )

        let presenter = CakeListPresenter(
            commander: commander
        )

        let viewController = CakeListViewControllerImpl()

        viewController.presenter = presenter
        presenter.view = viewController

        self.viewController = viewController

        router.push(vc: viewController)
    }

    func navigateToCakeDetail(cakeItem: CakeItem) {
        CakeDetailCoordinatorImpl(
            router: router,
            cakeItem: cakeItem
        ).present(animated: true)
    }
}
