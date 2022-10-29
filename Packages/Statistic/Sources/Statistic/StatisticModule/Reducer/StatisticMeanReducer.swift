//
//  StatisticMeanReducer.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/8/22.
//

import Architecture

import RxSwift

final class StatisticMeanReducer: BaseReducer, ReactiveCompatible {
    private let statisticUseCase: StatisticUseCase
    private let viewAction: Observable<StatisticViewAction>
    private let stateSubject: BehaviorSubject<StatisticViewState>

    init(
        statisticUseCase: StatisticUseCase,
        viewAction: Observable<StatisticViewAction>,
        stateSubject: BehaviorSubject<StatisticViewState>
    ) {
        self.statisticUseCase = statisticUseCase
        self.stateSubject = stateSubject
        self.viewAction = viewAction
        super.init()
        bind()
    }

    func bind() {
        viewAction
            .compactMap(\.buttonTapped)
            .mapCast(StatisticCalcButtonViewState.self)
            .withLatestFrom(stateSubject)
            .withUnretained(self)
            .flatMap { unretained, viewState in
                unretained.statisticUseCase.getMean(values: viewState.setOfNumbersToDouble).map { result in
                    switch result {
                    case let .success(value):
                        return viewState.changing(\.meanResult, value.string)

                    case let .failure(error):
                        return viewState.changing(\.meanResult, error.errorDescription)
                    }
                }
            }
            .bind(to: stateSubject)
            .disposed(by: rx.disposeBag)
    }
}
