//
//  CakeListBackCommand.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

import RxSwift
import Architecture

final class CakeListBackCommand: BaseCommand {
    init(
        viewAction: Observable<CakeListViewAction>
    ) {
        super.init()

        bind(viewAction: viewAction)
    }

    private func bind(viewAction: Observable<CakeListViewAction>) {
        viewAction
            .compactMap(\.back)
            .withUnretained(self)
            .subscribe(onNext: { $0.0.execute() })
            .disposed(by: disposeBag)
    }

    private func execute() {
        print("limit::", #function, "send analytics")
    }
}
