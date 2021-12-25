//
//  CakeListPresenter.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

import Architecture

final class CakeListPresenter: BasePresenter {
    // swiftlint:disable:next implicitly_unwrapped_optional
    weak var view: CakeListViewController! {
        didSet { bindLifeCycle() }
    }

    private let commander: CakeListCommander

    init(commander: CakeListCommander) {
        self.commander = commander
    }

    private func bindLifeCycle() {
        view.lifeCycleObservable
            .subscribe(onNext: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .viewDidLoad: self.binding()
                case .viewWillAppear: self.executeViewWillAppear()
                default:
                    return
                }
            })
            .disposed(by: rx.disposeBag)
    }

    private func binding() {
        commander.model
            .drive(view.data)
            .disposed(by: rx.disposeBag)

        view.action
            .asObservable()
            .bind(to: commander.viewAction)
            .disposed(by: rx.disposeBag)
    }

    private func executeViewWillAppear() {
        commander.viewAction.onNext(.onGetCakeList)
    }
}
