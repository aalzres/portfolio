//
//  BaseUICollectionViewCell.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/8/22.
//

import RxSwift

import UIKit

open class BaseUICollectionViewCell<ViewState: BaseUICollectionViewState>: UICollectionViewCell {
    public lazy var disposeBag = DisposeBag()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    open override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = .init()
        bind()
    }

    open func setupView() {
        addAllSubviews()
        addAllConstraints()
        bind()
    }

    open func addAllSubviews() {}
    open func addAllConstraints() {}
    open func bind() {}

    open func set(viewState: ViewState) { }

    deinit { BaseDeinit.shared.printDeinit(self) }
}
