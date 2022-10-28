//
//  ModuleCakeView+Constraints.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 11/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

import CoreGraphics

extension ModuleCakeViewControllerImpl {
    func underlyingAddAllSubviews() {
        view.addSubview(logoImageView)
    }
    func underlyinAddAllConstraints() {
        logoImageView.snp.makeConstraints {
            $0.size.equalTo(CGSize.logoImageSize)
            $0.center.equalToSuperview()
        }
    }
}

extension CGSize {
    static let logoImageSize: CGSize = .init(width: 128, height: 128)
}
