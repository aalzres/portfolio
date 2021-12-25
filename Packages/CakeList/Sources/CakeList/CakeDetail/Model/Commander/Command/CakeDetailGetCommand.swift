//
//  CakeDetailGetCommand.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 24/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

import RxSwift

import Architecture

final class CakeDetailGetCommand: BaseCommand {
    private let interactor: CakeDetailInteractor

    init(
        viewAction: Observable<CakeDetailViewAction>,
        interactor: CakeDetailInteractor
    ) {
        self.interactor = interactor
        super.init()

        bind(viewAction: viewAction)
    }

    private func bind(viewAction: Observable<CakeDetailViewAction>) {
        viewAction
            .compactMap(\.getCakeDetail)
            .withUnretained(self)
            .subscribe(onNext: { $0.0.execute() })
            .disposed(by: rx.disposeBag)
    }

    private func execute() {
        interactor.getCakeItem.execute()
    }
}
