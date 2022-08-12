//
//  StatisticRemoveInputReducer.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/8/22.
//

import Architecture

import RxSwift

final class StatisticRemoveInputReducer: BaseReducer {
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
            .mapCast(StatisticRemoveButtonViewState.self)
            .withLatestFrom(stateSubject) { $1.changing(\.setOfNumbers, String($1.setOfNumbers.dropLast())) }
            .bind(to: stateSubject)
            .disposed(by: rx.disposeBag)
    }
}
