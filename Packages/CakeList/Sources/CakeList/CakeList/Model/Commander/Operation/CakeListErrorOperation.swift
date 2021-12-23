//
//  CakeListErrorOperation.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

import UIKit
import RxSwift

import Architecture

final class CakeListErrorOperation: BaseOperation {
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
        let completion: ((UIAlertAction) -> Void)? = { [weak self] _ in
            self?.interactor.getCakeListItem.execute()
        }

        interactor.getCakeListItem.underlyingError
            .withLatestFrom(stateSubject) { $1.changing(alert: $0.alert(completion)) }
            .bind(to: stateSubject)
            .disposed(by: disposeBag)
    }
}
