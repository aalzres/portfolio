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

final class CakeListViewControllerImpl: BaseViewControllerImpl, CakeListViewController, UIScrollViewDelegate {
    // MARK: - UIElements
    lazy var cakeItemSize = CGSize(width: (view.width - .paddingXS * 4) / 2, height: view.height/4)
    lazy var collectionViewLayout = UICollectionViewFlowLayout()
        .set(\.sectionInset, UIEdgeInsets(inset: .paddingXS))
        .set(\.itemSize, cakeItemSize)

    lazy var cakeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        .set(\.register, CakeCollectionViewCell.self)
        .set(\.backgroundColor, .background)

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
        title = "cake_list_title_view".localized()
        view.backgroundColor = .background
        addAllSubviews()
        addAllConstraints()
        bindState()
        bindActions()
    }

    // MARK: - Binding
    private func bindState() {
        bindCakeCollectionView()
        bindAlert()
        bindLoading()
    }

    private func bindCakeCollectionView() {
        let items = (CakeCollectionViewCell.reuseIdentifier, CakeCollectionViewCell.self)
        dataSubject
            .map(\.cakeViewState)
            .bind(to: cakeCollectionView.rx.items(cellIdentifier: items.0, cellType: items.1))  { _, viewState, cell in
                cell.representable = viewState
            }
            .disposed(by: rx.disposeBag)
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
