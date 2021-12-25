//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//


import RxSwift
import Architecture

final class CakeListTapCakeCommand: BaseCommand {
    private let coordinator: CakeListCoordinator

    init(
        viewAction: Observable<CakeListViewAction>,
        coordinator: CakeListCoordinator
    ) {
        self.coordinator = coordinator
        super.init()
        bind(viewAction: viewAction)
    }

    private func bind(viewAction: Observable<CakeListViewAction>) {
        viewAction
            .compactMap(\.tapCakeDetail)
            .withUnretained(self)
            .subscribe(onNext: { $0.execute($1) })
            .disposed(by: rx.disposeBag)
    }

    private func execute(_ representable: CakeRepresentable) {
        coordinator.navigateToCakeDetail(cakeItem: representable.item)
    }
}
