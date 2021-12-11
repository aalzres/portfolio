//
//  ModuleCakeViewController.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 11/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

import RxSwift
import RxCocoa

import Architecture

protocol ModuleCakeViewController: BaseViewController {
    var data: AnyObserver<ModuleCakeViewState> { get }
    var action: Driver<ModuleCakeViewAction> { get }
}

final class ModuleCakeViewControllerImpl: BaseViewControllerImpl, ModuleCakeViewController {
    // MARK: - UIElements

    // MARK: - Reactive State and Actions
    private let dataSubject = PublishSubject<ModuleCakeViewState>()
    var data: AnyObserver<ModuleCakeViewState> {
        dataSubject.asObserver()
    }
    
    private let actionSubject = PublishSubject<ModuleCakeViewAction>()
    var action: RxCocoa.Driver<ModuleCakeViewAction> {
        actionSubject.asDriverIgnoringErrors()
    }

    // MARK: - Setup
    override func setupView() {
        super.setupView()
        addAllSubviews()
        addAllConstraints()
        bindState()
        bindActions()
    }

    // MARK: - Binding
    private func bindState() {
        bindLoading()
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
//        onBack
//            .mapTo(.onBack)
//            .drive(actionSubject)
//            .disposed(by: rx.disposeBag)
    }
}
