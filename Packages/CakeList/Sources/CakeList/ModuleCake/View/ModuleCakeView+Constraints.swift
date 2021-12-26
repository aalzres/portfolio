//
//  ModuleCakeView+Constraints.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 11/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

import CoreGraphics

extension ModuleCakeViewControllerImpl {
    override func addAllSubviews() {
        super.addAllSubviews()
        view.addSubview(logoImageView)
    }
    override func addAllConstraints() {
        super.addAllConstraints()
        logoImageView.snp.makeConstraints {
            $0.size.equalTo(CGSize.logoImageSize)
            $0.center.equalToSuperview()
        }
    }
}

extension CGSize {
    static let logoImageSize: CGSize = .init(width: 128, height: 128)
}
