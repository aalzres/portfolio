//
//  CakeDetailView+Constraints.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 24/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

extension CakeDetailViewControllerImpl {
    func addAllSubviews() {
        view.addSubviews([cakeImageView, cakeLabel])
    }
    func addAllConstraints() {
        cakeImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontal.equalToSuperview()
        }
        cakeLabel.snp.makeConstraints {
            $0.top.equalTo(cakeImageView.snp.bottom).offset(.paddingS)
            $0.centerX.equalToSuperview()
        }
    }
}
