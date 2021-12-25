//
//  CakeDetailScreenTimeCommand.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 24/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

import RxSwift
import Architecture

final class CakeDetailScreenTimeCommand: BaseCommand {
    init(
        viewAction: Observable<CakeDetailViewAction>
    ) {
        super.init()
        bind(viewAction: viewAction)
    }

    private func bind(viewAction: Observable<CakeDetailViewAction>) {
        viewAction
            .compactMap(\.screenTime)
            .withUnretained(self)
            .subscribe(onNext: { $0.execute($1) })
            .disposed(by: rx.disposeBag)
    }

    private func execute(_ time: Int) {
        print("limit::", #function, "send time analytics \(time)")
    }
}
