//
//  CakeDetailCoordinator.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 24/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

import UIKit
import Domain
import Architecture

protocol CakeDetailCoordinator { }

public final class CakeDetailCoordinatorImpl: BaseCoordinator, CakeDetailCoordinator {
    weak var viewController: UIViewController?
    private let cakeItem: CakeItem

    public init(
        router: Router,
        cakeItem: CakeItem
    ) {
        self.cakeItem = cakeItem
        super.init(router: router)
    }

    public func present(animated: Bool) {
        let interactor = CakeDetailInteractorImpl(
            cakeItem: cakeItem
        )

        let commander = CakeDetailCommanderImpl(
            coordinator: self,
            interactor: interactor
        )

        let presenter = CakeDetailPresenter(
            commander: commander
        )

        let viewController = CakeDetailViewControllerImpl()

        viewController.presenter = presenter
        presenter.view = viewController

        self.viewController = viewController

        router.present(vc: viewController)
    }
}
