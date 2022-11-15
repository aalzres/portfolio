//
//  CakeListScreenTimeCommand.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

import RxSwift
import Architecture

final class CakeListScreenTimeCommand: BaseCommand {
    init(
        viewAction: Observable<CakeListViewAction>
    ) {
        super.init()
        bind(viewAction: viewAction)
    }

    private func bind(viewAction: Observable<CakeListViewAction>) {
        viewAction
            .compactMap(\.screenTime)
            .withUnretained(self)
            .subscribe(onNext: { $0.execute($1) })
            .disposed(by: rx.disposeBag)
    }

    private func execute(_ time: Int) {
        print(#function, "send time analytics \(time)")
    }
}
