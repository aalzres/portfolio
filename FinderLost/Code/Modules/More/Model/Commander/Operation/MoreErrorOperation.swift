//
//  MoreErrorOperation.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 9/1/22.
//  
//

import RxSwift

import Architecture

final class MoreErrorOperation: BaseOperation {
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
//        interactor.action.underlyingError
//            .withLatestFrom(stateSubject) { $1.changing(toast: $0.toastError) }
//            .bind(to: stateSubject)
//            .disposed(by: disposeBag)
    }
}
