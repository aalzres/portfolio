//
//  ModuleCakeCoordinator.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 11/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

import UIKit
import Architecture
import Domain

protocol ModuleCakeCoordinator {
    func navigateToCakeList()
}

public final class ModuleCakeCoordinatorImpl: BaseCoordinator, ModuleCakeCoordinator {
    private weak var viewController: UIViewController?
    private let cakeListUseCase: CakeListUseCase

    public init(
        router: Router,
        cakeListUseCase: CakeListUseCase
    ) {
        self.cakeListUseCase = cakeListUseCase
        super.init(router: router)
    }

    public func present(animated: Bool) {
        let interactor = ModuleCakeInteractorImpl(
            cakeListUseCase: cakeListUseCase
        )

        let commander = ModuleCakeCommanderImpl(
            coordinator: self,
            interactor: interactor
        )

        let presenter = ModuleCakePresenter(
            commander: commander
        )

        let viewController = ModuleCakeViewControllerImpl()

        viewController.presenter = presenter
        presenter.view = viewController

        self.viewController = viewController

        router.push(vc: viewController)
    }

    func navigateToCakeList() {
        print("limit::", #function)
    }
}
