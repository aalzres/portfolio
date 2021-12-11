//
//  ModuleCakeScreenTimeCommand.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 11/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

import RxSwift
import Architecture

final class ModuleCakeScreenTimeCommand: BaseCommand {
    init(
        viewAction: Observable<ModuleCakeViewAction>
    ) {
        super.init()
        bind(viewAction: viewAction)
    }

    private func bind(viewAction: Observable<ModuleCakeViewAction>) {
        viewAction
            .compactMap(\.screenTime)
            .withUnretained(self)
            .subscribe(onNext: { $0.execute($1) })
            .disposed(by: disposeBag)
    }

    private func execute(_ time: Int) {
        print("limit::", #function, "send analytics")
    }
}
