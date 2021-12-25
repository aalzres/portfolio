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

    // MARK: - Setup
    override func setupView() {
        super.setupView()
        view.backgroundColor = .light
        addAllSubviews()
        addAllConstraints()
        bindState()
        bindActions()
    }

    // MARK: - Binding
    private func bindState() {
        bindCake()
        bindToast()
        bindLoading()
    }

    private func bindCake() {
        dataSubject
            .compactMap(\.cakeRepresentable?.imageUrl)
            .compactMap { URLRequest(urlString: $0) }
            .flatMap {
                URLSession.shared.rx
                    .response(request: $0)
                    .subscribe(on: ConcurrentMainScheduler.instance)
                    .map { UIImage(data: $0.data) }
            }
            .bind(to: cakeImageView.rx.image)
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
