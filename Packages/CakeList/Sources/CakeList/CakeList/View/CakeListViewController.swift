//
//  CakeListViewController.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

import RxSwift
import RxCocoa

import Architecture
import UIKit

protocol CakeListViewController: BaseViewController {
    var data: AnyObserver<CakeListViewState> { get }
    var action: Driver<CakeListViewAction> { get }
}

final class CakeListViewControllerImpl: BaseViewControllerImpl, CakeListViewController {
    // MARK: - UIElements

    // MARK: - Reactive State and Actions
    private let dataSubject = PublishSubject<CakeListViewState>()
    var data: AnyObserver<CakeListViewState> {
        dataSubject.asObserver()
    }
    
    private let actionSubject = PublishSubject<CakeListViewAction>()
    var action: RxCocoa.Driver<CakeListViewAction> {
        actionSubject.asDriverIgnoringErrors()
    }

    // MARK: - Setup
    override func setupView() {
        super.setupView()
        view.backgroundColor = .background
        addAllSubviews()
        addAllConstraints()
        bindState()
        bindActions()
    }

    // MARK: - Binding
    private func bindState() {
        bindAlert()
        bindLoading()
    }

    private func bindAlert() {
        dataSubject
            .map(\.alert)
            .bind(to: view.rx.presentAlert)
            .disposed(by: rx.disposeBag)
    }

    private func bindLoading() {
        dataSubject
            .map(\.isLoading)
            .bind(to: loadingStatusSubject)
            .disposed(by: rx.disposeBag)
    }

    private func bindActions() {
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
