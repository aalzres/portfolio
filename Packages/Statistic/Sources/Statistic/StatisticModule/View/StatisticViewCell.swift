//
//  StatisticViewCell.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/8/22.
//

import Architecture
import UserInterface

import UIKit

final class StatisticViewCell: BaseUICollectionViewCell<StatisticButtonViewStateImpl> {
    private lazy var customButton = CButton()
        .set(\.isUserInteractionEnabled, false)

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

    func set(viewState: StatisticButtonViewState) {
        customButton.text = viewState.title
    }
}
