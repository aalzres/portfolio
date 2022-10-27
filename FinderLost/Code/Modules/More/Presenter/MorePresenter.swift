//
//  MorePresenter.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 9/1/22.
//  
//

import Architecture

final class MorePresenter: BasePresenter {
    // swiftlint:disable:next implicitly_unwrapped_optional
    weak var view: MoreViewController! {
        didSet { bindLifeCycle() }
    }

    private let commander: MoreCommander

    init(commander: MoreCommander) {
        self.commander = commander
    }

    private func bindLifeCycle() {
        view.lifeCycleObservable
            .subscribe(onNext: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .viewDidLoad: self.binding()
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
}
