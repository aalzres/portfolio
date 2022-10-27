//
//  CakeDetailViewController.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 24/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

import RxSwift
import RxCocoa

import UIKit
import Architecture

protocol CakeDetailViewController: BaseViewController {
    var data: AnyObserver<CakeDetailViewState> { get }
    var action: Driver<CakeDetailViewAction> { get }
}

final class CakeDetailViewControllerImpl: BaseViewControllerImpl, CakeDetailViewController {
    override var backgroundColor: UIColor? { .light }
    // MARK: - UIElements
    lazy var cakeImageView = UIImageView()
        .set(\.contentMode, .top)
    lazy var cakeLabel = UILabel()
        .set(\.textColor, .darkText)
        .set(\.font, .subtitle)
        .set(\.textAlignment, .center)
    // MARK: - Reactive State and Actions
    private let dataSubject = PublishSubject<CakeDetailViewState>()
    var data: AnyObserver<CakeDetailViewState> {
        dataSubject.asObserver()
    }
    
    private let actionSubject = PublishSubject<CakeDetailViewAction>()
    var action: RxCocoa.Driver<CakeDetailViewAction> {
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
        bindCake()
        bindToast()
        bindLoading()
    }

    private func bindCake() {
        dataSubject
            .compactMap(\.cakeRepresentable?.image)
            .bind(to: cakeImageView.rx.imageRepresentable)
            .disposed(by: rx.disposeBag)

        dataSubject
            .map(\.cakeRepresentable?.description)
            .bind(to: cakeLabel.rx.text)
            .disposed(by: rx.disposeBag)
    }

    private func bindToast() {
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
