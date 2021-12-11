//
//  ModuleCakeLoadingOperation.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 11/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

import RxSwift
import Architecture

final class ModuleCakeLoadingOperation: BaseOperation {
    private let interactor: ModuleCakeInteractor
    private let stateSubject: BehaviorSubject<ModuleCakeViewState>

    init(
        interactor: ModuleCakeInteractor,
        stateSubject: BehaviorSubject<ModuleCakeViewState>
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
            .disposed(by: disposeBag)
    }
}
