//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//

import RxSwift
import UIKit

import Architecture
import UserInterface

final class ModuleCakeGetOperation: BaseOperation {
    private let interactor: ModuleCakeInteractor
    private let coordinator: ModuleCakeCoordinator

    init(
        interactor: ModuleCakeInteractor,
        coordinator: ModuleCakeCoordinator
    ) {
        self.interactor = interactor
        self.coordinator = coordinator
        super.init()

        bind()
    }

    private func bind() {
        interactor.getCakeListItem.elements
            .withUnretained(self)
            .subscribe(onNext: { $0.0.coordinator.navigateToCakeList() })
            .disposed(by: disposeBag)
    }
}
