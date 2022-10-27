//
//  MoreBackCommand.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 9/1/22.
//  
//

import RxSwift

import Architecture

final class MoreBackCommand: BaseCommand {
//    private let analytics: MoreAnalytics

    init(
        viewAction: Observable<MoreViewAction>
//        analytics: MoreAnalytics
    ) {
//        self.analytics = analytics
        super.init()

        bind(viewAction: viewAction)
    }

    private func bind(viewAction: Observable<MoreViewAction>) {
        viewAction
            .compactMap(\.back)
            .withUnretained(self)
            .subscribe(onNext: { $0.0.execute() })
            .disposed(by: rx.disposeBag)
    }

    private func execute() {
//        analytics.track(event: .back)
    }
}
