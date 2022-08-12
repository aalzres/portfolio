//
//  StatisticGetButtonsReducer.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/8/22.
//

import Architecture

import RxSwift

final class StatisticGetButtonsReducer: BaseReducer {
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
            .compactMap(\.viewDidLoad)
            .withLatestFrom(stateSubject) {
                $1.changing(\.customButtonList, [
                    StatisticDigitButtonViewState(title: "1"),
                    StatisticDigitButtonViewState(title: "2"),
                    StatisticDigitButtonViewState(title: "3"),
                    StatisticDigitButtonViewState(title: "4"),
                    StatisticDigitButtonViewState(title: "5"),
                    StatisticDigitButtonViewState(title: "6"),
                    StatisticDigitButtonViewState(title: "7"),
                    StatisticDigitButtonViewState(title: "8"),
                    StatisticDigitButtonViewState(title: "9"),
                    StatisticDigitButtonViewState(title: "0"),
                    StatisticDigitButtonViewState(title: "."),
                    StatisticDigitButtonViewState(title: ","),
                    StatisticDeleteButtonViewState(title: "C"),
                    StatisticRemoveButtonViewState(title: "<-"),
                    StatisticCalcButtonViewState(title: "=")
                ])
            }
            .bind(to: stateSubject)
            .disposed(by: rx.disposeBag)
    }
}
