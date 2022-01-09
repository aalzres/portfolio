//
//  MoreLoadingOperation.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 9/1/22.
//  
//

import RxSwift

import Architecture

final class MoreLoadingOperation: BaseOperation {
    private let interactor: MoreInteractor
    private let stateSubject: BehaviorSubject<MoreViewState>

    init(
        interactor: MoreInteractor,
        stateSubject: BehaviorSubject<MoreViewState>
    ) {
        self.interactor = interactor
        self.stateSubject = stateSubject
        super.init()

        bind()
    }

    private func bind() {
//        let executing = Observable.merge(
//            interactor.action.executing
//        )
//
//        executing
//            .withLatestFrom(stateSubject) { $1.changing(isLoading: $0) }
//            .bind(to: stateSubject)
//            .disposed(by: disposeBag)
    }
}
