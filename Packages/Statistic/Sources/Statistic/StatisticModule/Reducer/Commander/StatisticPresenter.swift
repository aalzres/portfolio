//
//  StatisticPresenter.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/8/22.
//

import RxSwift

import Architecture

final class StatisticPresenter: BasePresenter {
    // swiftlint:disable:next implicitly_unwrapped_optional
    weak var view: StatisticViewController! {
        didSet { binding() }
    }

    private let commander: StatisticCommander

    init(commander: StatisticCommander) {
        self.commander = commander
    }

    private func binding() {
        commander.model
            .drive(view.data)
            .disposed(by: rx.disposeBag)

        Observable.merge(
            view.lifeCycleObservable.asViewAction(),
            view.action.asObservable()
        )
            .bind(to: commander.viewAction)
            .disposed(by: rx.disposeBag)
    }
}
