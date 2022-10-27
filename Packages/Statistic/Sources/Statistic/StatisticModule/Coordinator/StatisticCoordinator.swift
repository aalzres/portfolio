//
//  StatisticCoordinator.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/8/22.
//

import UIKit

import Domain
import Architecture

protocol StatisticCoordinator { }

public final class StatisticCoordinatorImpl: BaseCoordinator, StatisticCoordinator {
    private weak var viewController: UIViewController?
    private let statisticUseCase: StatisticUseCase

    public init(
        router: Router,
        statisticUseCase: StatisticUseCase
    ) {
        self.statisticUseCase = statisticUseCase
        super.init(router: router)
    }

    public func present() {
        let commander = StatisticCommanderImpl(
            statisticUseCase: statisticUseCase
        )

        let presenter = StatisticPresenter(
            commander: commander
        )

        let viewController = StatisticViewControllerImpl()

        viewController.presenter = presenter
        presenter.view = viewController

        self.viewController = viewController

        router.push(vc: viewController)
    }
}
