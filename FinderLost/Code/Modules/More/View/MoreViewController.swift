//
//  MoreViewController.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 9/1/22.
//  
//

import RxSwift
import RxCocoa

import Architecture

protocol MoreViewController: BaseViewController {
    var data: AnyObserver<MoreViewState> { get }
    var action: Driver<MoreViewAction> { get }
}

final class MoreViewControllerImpl: BaseViewControllerImpl, MoreViewController {
    // MARK: - UIElements

    // MARK: - Reactive State and Actions
    private let dataSubject = PublishSubject<MoreViewState>()
    var data: AnyObserver<MoreViewState> {
        dataSubject.asObserver()
    }
    
    private let actionSubject = PublishSubject<MoreViewAction>()
    var action: RxCocoa.Driver<MoreViewAction> {
        actionSubject.asDriverIgnoringErrors()
    }

    // MARK: - Binding
    override func bindState() {
        super.bindState()
        bindAlert()
        bindLoading()
    }

    private func bindAlert() {
        dataSubject
            .compactMap(\.alert)
            .bind(to: view.rx.presentAlert)
            .disposed(by: rx.disposeBag)
    }

    private func bindLoading() {
        dataSubject
            .map(\.isLoading)
            .bind(to: loadingStatusSubject)
            .disposed(by: rx.disposeBag)
    }

    override func bindActions() {
        super.bindActions()
        bindTimeView()
        bindBack()
    }

    private func bindTimeView() {
        screenTime
            .map { .onScreenTime($0) }
            .drive(actionSubject)
            .disposed(by: rx.disposeBag)
    }

    private func bindBack() {
        onBack
            .mapTo(.onBack)
            .drive(actionSubject)
            .disposed(by: rx.disposeBag)
    }
}
