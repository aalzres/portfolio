//
//  CakeDetailLoadingOperation.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 24/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

import RxSwift
import Architecture

final class CakeDetailLoadingOperation: BaseOperation {
    private let interactor: CakeDetailInteractor
    private let stateSubject: BehaviorSubject<CakeDetailViewState>

    init(
        interactor: CakeDetailInteractor,
        stateSubject: BehaviorSubject<CakeDetailViewState>
    ) {
        self.interactor = interactor
        self.stateSubject = stateSubject
        super.init()

        bind()
    }

    private func bind() {
        let executing = Observable.merge(
            interactor.getCakeItem.executing
        )

        executing
            .withLatestFrom(stateSubject) { $1.changing(isLoading: $0) }
            .bind(to: stateSubject)
            .disposed(by: rx.disposeBag)
    }
}
