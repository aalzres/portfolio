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

    var dynamicData: String = ""
}

extension CakeListViewState {
    func changing(dynamicData: String) -> Self {
        var copy = copyMe()
        copy.dynamicData = dynamicData
        return copy
    }
}
