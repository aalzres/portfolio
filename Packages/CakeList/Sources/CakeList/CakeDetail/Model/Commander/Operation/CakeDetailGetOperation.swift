//
//  CakeDetailGetOperation.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 24/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

import RxSwift

import Domain
import Architecture

final class CakeDetailGetOperation: BaseOperation {
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
        interactor.getCakeItem.elements
            .withLatestFrom(stateSubject) { $1.changing(cakeRepresentable: .init($0)) }
            .bind(to: stateSubject)
            .disposed(by: rx.disposeBag)
    }
}

private extension CakeRepresentable {
    init(_ cakeItem: CakeItem) {
        self.init(
            item: cakeItem,
            title: cakeItem.title,
            description: cakeItem.description,
            image: .external(cakeItem.image)
        )
    }
}
