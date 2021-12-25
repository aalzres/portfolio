//
//  CakeListLoadingOperation.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

import RxSwift

import Architecture

final class CakeListLoadingOperation: BaseOperation {
    private let interactor: CakeListInteractor
    private let stateSubject: BehaviorSubject<CakeListViewState>

    init(
        interactor: CakeListInteractor,
        stateSubject: BehaviorSubject<CakeListViewState>
    ) {
        self.interactor = interactor
        self.stateSubject = stateSubject
        super.init()

        bind()
    }

    private func bind() {
        let executing = Observable.merge(
            interactor.getCakeListItem.executing
        )

        executing
            .withLatestFrom(stateSubject) { $1.changing(isLoading: $0) }
            .bind(to: stateSubject)
            .disposed(by: rx.disposeBag)
    }
}
