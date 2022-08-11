//
//  StatisticViewCell.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/8/22.
//

import Architecture
import UserInterface

final class StatisticViewCell: BaseUICollectionViewCell<StatisticButtonViewState> {
    private lazy var customButton = CButton()

    override func addAllSubviews() {
        super.addAllSubviews()
        contentView.addSubview(customButton)
    }

    override func addAllConstraints() {
        super.addAllConstraints()
        customButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(.buttonHeight)
        }
    }

    override func set(viewState: StatisticButtonViewState) {
        super.set(viewState: viewState)
        customButton.text = viewState.title
    }
}
