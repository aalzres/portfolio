//
//  ModuleCakeGetErrorOperation.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 11/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

import RxSwift
import UIKit

import Architecture
import UserInterface

final class ModuleCakeGetErrorOperation: BaseOperation {
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
        let completion: ((UIAlertAction) -> Void)? = { [weak self] _ in
            self?.interactor.getCakeListItem.execute()
        }

        interactor.getCakeListItem.underlyingError
            .withLatestFrom(stateSubject) { $1.changing(alert: $0.alert(completion)) }
            .bind(to: stateSubject)
            .disposed(by: rx.disposeBag)
    }
}
