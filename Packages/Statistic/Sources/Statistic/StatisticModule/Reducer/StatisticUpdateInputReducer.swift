//
//  StatisticUpdateInputReducer.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/8/22.
//

import Architecture

import RxSwift

final class StatisticUpdateInputReducer: BaseReducer, ReactiveCompatible {
    private let viewAction: Observable<StatisticViewAction>
    private let stateSubject: BehaviorSubject<StatisticViewState>

    init(
        viewAction: Observable<StatisticViewAction>,
        stateSubject: BehaviorSubject<StatisticViewState>
    ) {
        self.stateSubject = stateSubject
        self.viewAction = viewAction
        super.init()
        bind()
    }

    func bind() {
        viewAction
            .compactMap(\.buttonTapped)
            .mapCast(StatisticDigitButtonViewState.self)
            .withLatestFrom(stateSubject) { $1.changing(\.setOfNumbers, $1.setOfNumbers + $0.title) }
            .bind(to: stateSubject)
            .disposed(by: rx.disposeBag)
    }
}
