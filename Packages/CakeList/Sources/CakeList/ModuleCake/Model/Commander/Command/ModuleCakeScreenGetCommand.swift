//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//

import RxSwift
import Architecture

final class ModuleCakeGetCommand: BaseCommand {
    private let interator: ModuleCakeInteractor

    init(
        viewAction: Observable<ModuleCakeViewAction>,
        interator: ModuleCakeInteractor
    ) {
        self.interator = interator
        super.init()
        bind(viewAction: viewAction)
    }

    private func bind(viewAction: Observable<ModuleCakeViewAction>) {
        viewAction
            .compactMap(\.getCakeList)
            .withUnretained(self)
            .subscribe(onNext: { $0.0.execute() })
            .disposed(by: disposeBag)
    }

    private func execute() {
        interator.getCakeListItem.execute()
    }
}
