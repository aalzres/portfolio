//
//  ModuleCakePresenter.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 11/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

import Architecture

final class ModuleCakePresenter: BasePresenter {
    // swiftlint:disable:next implicitly_unwrapped_optional
    weak var view: ModuleCakeViewController! {
        didSet { bindLifeCycle() }
    }

    private let commander: ModuleCakeCommander

    init(commander: ModuleCakeCommander) {
        self.commander = commander
    }

    private func bindLifeCycle() {
        view.lifeCycleObservable
            .subscribe(onNext: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .viewDidLoad:
                    self.binding()
                    self.executeViewDidLoad()
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

    private func executeViewDidLoad() {
        commander.viewAction.onNext(.onGetCakeList)
    }
}
