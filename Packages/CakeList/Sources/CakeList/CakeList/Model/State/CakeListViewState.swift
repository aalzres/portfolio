//
//  CakeListViewState.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

import Architecture
import UserInterface

struct CakeListViewState: BaseViewState {
    var alert: AlertRepresentable? = nil
    var isLoading: Bool = false

    var cakeViewState: [CakeRepresentable] = []
}

extension CakeListViewState {
    func changing(cakeViewState: [CakeRepresentable]) -> Self {
        var copy = copyMe()
        copy.cakeViewState = cakeViewState
        return copy
    }
}
