//
//  StatisticDeleteButtonsReducer.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/8/22.
//

import Architecture

import RxSwift

final class StatisticDeleteButtonsReducer: BaseReducer {
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
            .mapCast(StatisticDeleteButtonViewState.self)
            .withLatestFrom(stateSubject) {
                $1
                    .changing(\.setOfNumbers, "")
                    .changing(\.meanResult, "")
                    .changing(\.medianResult, "")
            }
            .bind(to: stateSubject)
            .disposed(by: rx.disposeBag)
    }
}
