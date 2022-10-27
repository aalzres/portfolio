//
//  MoreCoordinator.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 9/1/22.
//  
//

import UIKit

import Architecture

protocol MoreCoordinator { }

public final class MoreCoordinatorImpl: BaseCoordinator, MoreCoordinator {
    weak var viewController: UIViewController?

    public func present(animated: Bool = true) {
        let interactor = MoreInteractorImpl()

        let commander = MoreCommanderImpl(
            coordinator: self,
            interactor: interactor
        )

        let presenter = MorePresenter(
            commander: commander
        )

        let viewController = MoreViewControllerImpl()

        viewController.presenter = presenter
        presenter.view = viewController

        self.viewController = viewController

        router.set(vc: viewController)
    }
}
