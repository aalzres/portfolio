//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//


import RxSwift
import Architecture

final class CakeListGetCommand: BaseCommand {
    private let interator: CakeListInteractor

    init(
        viewAction: Observable<CakeListViewAction>,
        interator: CakeListInteractor
    ) {
        self.interator = interator
        super.init()
        bind(viewAction: viewAction)
    }

    private func bind(viewAction: Observable<CakeListViewAction>) {
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
