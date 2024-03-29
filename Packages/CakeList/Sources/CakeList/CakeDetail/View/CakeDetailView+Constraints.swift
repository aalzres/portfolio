//
//  CakeDetailView+Constraints.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 24/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

extension CakeDetailViewControllerImpl {
    func underlyingAddAllSubviews() {
        view.addSubviews([cakeImageView, cakeLabel])
    }
    func underlyinAddAllConstraints() {
        cakeImageView.snp.makeConstraints {
            $0.top.horizontal.equalToSuperview()
        }
        cakeLabel.snp.makeConstraints {
            $0.top.equalTo(cakeImageView.snp.bottom).offset(.paddingS)
            $0.centerX.equalToSuperview()
        }
    }
}
