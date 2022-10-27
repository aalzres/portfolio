//
//  StatisticViewControllerImpl.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/8/22.
//

import Utilities
import Architecture
import UserInterface

import UIKit

import RxSwift
import RxCocoa
import RxGesture

protocol StatisticViewController: BaseViewController {
    var data: AnyObserver<StatisticViewState> { get }
    var action: Driver<StatisticViewAction> { get }
}

public final class StatisticViewControllerImpl: BaseUIScrollViewController, StatisticViewController {
    private lazy var contentStackView = UIStackView()
        .set(\.axis, .vertical)
        .set(\.spacing, .paddingS)
    private lazy var descriptionLabel = UILabel()
        .set(\.textColor, .darkText)
        .set(\.font, .subtitle)
        .set(\.numberOfLines, .unlimitedLines)
        .set(\.text, "statistic_description".localized())
    private lazy var setOfNumbersInput = UITextField()
        .set(\.inputView, .init())
        .set(\.font, .inputPrimary)
        .set(\.textColor, .black)
        .addLine(position: .bottom)
    private lazy var meanLabel = UILabel()
        .set(\.textColor, .darkText)
        .set(\.font, .subtitle)
    private lazy var medianLabel = UILabel()
        .set(\.textColor, .darkText)
        .set(\.font, .subtitle)
    
    let horizontalPadding: CGFloat = .paddingS + .paddingS
    let spaceItem: CGFloat = .paddingS + .paddingS
    lazy var itemSize = CGSize(width: (view.width - horizontalPadding - spaceItem) / 3, height: .buttonHeight)
    lazy var collectionViewLayout = UICollectionViewFlowLayout()
        .set(\.itemSize, itemSize)
    
    lazy var collectionView = DynamicSizeCollectionView(
        frame: .zero,
        collectionViewLayout: collectionViewLayout
    )
        .set(\.register, StatisticViewCell.self)
        .set(\.backgroundColor, .background)
    
    let dataSubject = BehaviorSubject<StatisticViewState>(value: .init())
    var data: AnyObserver<StatisticViewState> {
        dataSubject.asObserver()
    }
    
    let actionSubject = PublishSubject<StatisticViewAction>()
    var action: RxCocoa.Driver<StatisticViewAction> {
        actionSubject.asDriverIgnoringErrors()
    }
    
    public override func setupView() {
        super.setupView()
        title = "statistic_title_view".localized()
    }
    
    public override func addAllSubviews() {
        super.addAllSubviews()
        contentView.addSubview(contentStackView)
        contentStackView.addArrangedSubviews([
            descriptionLabel,
            setOfNumbersInput,
            meanLabel,
            medianLabel,
            collectionView
        ])
    }
    
    public override func addAllConstraints() {
        super.addAllConstraints()
        contentStackView.snp.makeConstraints {
            $0.edges.width.equalToSuperview().inset(.paddingS)
        }
    }
    
    public override func bindState() {
        super.bindState()
        dataSubject
            .map(\.setOfNumbers)
            .distinctUntilChanged()
            .bind(to: setOfNumbersInput.rx.text)
            .disposed(by: rx.disposeBag)
        
        let items = StatisticViewCell.self
        dataSubject
            .map(\.customButtonList)
            .bind(to: collectionView.rx.items(
                cellIdentifier: items.reuseIdentifier,
                cellType: items.self
            ))  { _, viewState, cell in
                cell.set(viewState: viewState)
            }
            .disposed(by: rx.disposeBag)

        dataSubject
            .map(\.meanResultText)
            .distinctUntilChanged()
            .bind(to: meanLabel.rx.text)
            .disposed(by: rx.disposeBag)

        dataSubject
            .map(\.medianResultText)
            .distinctUntilChanged()
            .bind(to: medianLabel.rx.text)
            .disposed(by: rx.disposeBag)
    }
    
    public override func bindActions() {
        super.bindActions()
        collectionView.rx.modelSelected(StatisticButtonViewState.self)
            .map { .onTapButton($0) }
            .bind(to: actionSubject)
            .disposed(by: rx.disposeBag)
    }
}
