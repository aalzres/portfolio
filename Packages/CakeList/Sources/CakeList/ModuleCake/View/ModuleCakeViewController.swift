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
import UIKit

protocol ModuleCakeViewController: BaseViewController {
    var data: AnyObserver<ModuleCakeViewState> { get }
    var action: Driver<ModuleCakeViewAction> { get }
}

final class ModuleCakeViewControllerImpl: BaseViewControllerImpl, ModuleCakeViewController {
    override var backgroundColor: UIColor? { .first }
    // MARK: - UIElements
    lazy var logoImageView = UIImageView()
        .set(\.image, UIImage(cakeListNamed: "module_cake_logo"))
        .set(\.tintColor, .light)
    // MARK: - Reactive State and Actions
    private let dataSubject = PublishSubject<ModuleCakeViewState>()
    var data: AnyObserver<ModuleCakeViewState> {
        dataSubject.asObserver()
    }
    
    private let actionSubject = PublishSubject<ModuleCakeViewAction>()
    var action: RxCocoa.Driver<ModuleCakeViewAction> {
        actionSubject.asDriverIgnoringErrors()
    }

    override func addAllSubviews() {
        super.addAllSubviews()
        underlyingAddAllSubviews()
    }

    override func addAllConstraints() {
        super.addAllConstraints()
        underlyinAddAllConstraints()
    }

    // MARK: - Binding
    override func bindState() {
        super.bindState()
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
