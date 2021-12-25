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
    private let stateSubject: BehaviorSubject<ModuleCakeViewState>

    init(
        interactor: ModuleCakeInteractor,
        coordinator: ModuleCakeCoordinator,
        stateSubject: BehaviorSubject<ModuleCakeViewState>
   ) {
        self.interactor = interactor
        self.coordinator = coordinator
       self.stateSubject = stateSubject
        super.init()

        bind()
    }

    private func bind() {
        let cakeListElements = interactor.getCakeListItem.elements.share()

        cakeListElements
            .skip(while: { $0.isEmpty })
            .withUnretained(self)
            .subscribe(onNext: { $0.0.execute() })
            .disposed(by: rx.disposeBag)

        cakeListElements
            .filter(\.isEmpty)
            .withLatestFrom(stateSubject) { $1.changing(alert: .withoutCake) }
            .bind(to: stateSubject)
            .disposed(by: rx.disposeBag)
    }

    private func execute() {
        coordinator.navigateToCakeList()
    }
}

private extension AlertRepresentable {
    static let withoutCake = AlertRepresentable(
        title: "module_cake_list_is_empty_alert_title".localized(),
        message: "module_cake_list_is_empty_alert_message".localized()
    )
}
