//
//  CakeListView+Constraints.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

import CoreGraphics
import Utilities

extension CakeListViewControllerImpl {
    func underlyingAddAllSubviews() {
        view.addSubview(cakeCollectionView)
    }
    func underlyinAddAllConstraints() {
        cakeCollectionView.snp.makeConstraints {
            $0.edges.equalTo(safeArea)
        }
    }
}
