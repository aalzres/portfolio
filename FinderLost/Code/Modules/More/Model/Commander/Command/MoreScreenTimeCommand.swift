//
//  MoreScreenTimeCommand.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 9/1/22.
//  
//

import RxSwift

import Architecture

final class MoreScreenTimeCommand: BaseCommand {
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
            .compactMap(\.screenTime)
            .withUnretained(self)
            .subscribe(onNext: { $0.execute($1) })
            .disposed(by: rx.disposeBag)
    }

    private func execute(_ time: Int) {
//        analytics.track(event: .screenTime(time))
    }
}
