//
//  ModuleCakeBackCommand.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 11/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

import RxSwift
import Architecture

final class ModuleCakeBackCommand: BaseCommand {
    init(
        viewAction: Observable<ModuleCakeViewAction>
    ) {
        super.init()

        bind(viewAction: viewAction)
    }

    private func bind(viewAction: Observable<ModuleCakeViewAction>) {
        viewAction
            .compactMap(\.back)
            .withUnretained(self)
            .subscribe(onNext: { $0.0.execute() })
            .disposed(by: rx.disposeBag)
    }

    private func execute() {
        print(#function, "send analytics")
    }
}
