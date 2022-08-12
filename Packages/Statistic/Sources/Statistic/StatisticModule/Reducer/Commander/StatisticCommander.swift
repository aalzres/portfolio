//
//  StatisticCommander.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/8/22.
//

import Architecture

import RxSwift
import RxCocoa

protocol StatisticCommander {
    var viewAction: AnyObserver<StatisticViewAction> { get }
    var model: Driver<StatisticViewState> { get }
}

final class StatisticCommanderImpl: BaseCommander, StatisticCommander {
    private let actionSubject = PublishSubject<StatisticViewAction>()
    var viewAction: AnyObserver<StatisticViewAction> { actionSubject.asObserver() }

    private let stateSubject: BehaviorSubject<StatisticViewState>
    var model: Driver<StatisticViewState> { stateSubject.asDriverIgnoringErrors() }

    init(
        statisticUseCase: StatisticUseCase
    ) {
        stateSubject = .init(value: .init())
        let viewAction = actionSubject.asObserver().share()

        super.init()

        reducer.append(
            contentsOf: [
                StatisticGetButtonsReducer(
                    viewAction: viewAction,
                    stateSubject: stateSubject
                ),
                StatisticUpdateInputReducer(
                    viewAction: viewAction,
                    stateSubject: stateSubject
                ),
                StatisticRemoveInputReducer(
                    viewAction: viewAction,
                    stateSubject: stateSubject
                ),
                StatisticDeleteButtonsReducer(
                    viewAction: viewAction,
                    stateSubject: stateSubject
                ),
                StatisticMeanReducer(
                    statisticUseCase: statisticUseCase,
                    viewAction: viewAction,
                    stateSubject: stateSubject
                ),
                StatisticMedianReducer(
                    statisticUseCase: statisticUseCase,
                    viewAction: viewAction,
                    stateSubject: stateSubject
                )
            ]
        )
    }
}
