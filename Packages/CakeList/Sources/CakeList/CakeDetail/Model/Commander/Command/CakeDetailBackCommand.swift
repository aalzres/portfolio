//
//  CakeDetailBackCommand.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 24/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

import RxSwift

import Architecture

final class CakeDetailBackCommand: BaseCommand {
    init(
        viewAction: Observable<CakeDetailViewAction>
    ) {
        super.init()

        bind(viewAction: viewAction)
    }

    private func bind(viewAction: Observable<CakeDetailViewAction>) {
        viewAction
            .compactMap(\.back)
            .withUnretained(self)
            .subscribe(onNext: { $0.0.execute() })
            .disposed(by: rx.disposeBag)
    }

    private func execute() {
        print("limit::", #function, "send analytics")
    }
}
