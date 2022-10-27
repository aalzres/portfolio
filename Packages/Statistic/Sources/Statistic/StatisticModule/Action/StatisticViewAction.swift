//
//  StatisticViewAction.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/8/22.
//

import Architecture

enum StatisticViewAction: BaseViewAction {
    case onTapButton(StatisticButtonViewState)
    case onLifeCycle(UIViewControllerLyfeCycle)

    init(lifeCycle: UIViewControllerLyfeCycle) {
        self = .onLifeCycle(lifeCycle)
    }
}

extension StatisticViewAction {
    var buttonTapped: StatisticButtonViewState? {
        guard case let .onTapButton(viewState) = self else { return nil }
        return viewState
    }
    var viewDidLoad: Void? {
        guard case .onLifeCycle(.viewDidLoad) = self else { return nil }
        return ()
    }
}
