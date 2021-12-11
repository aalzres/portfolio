//
//  ModuleCakeViewState.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 11/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

import Architecture

struct ModuleCakeViewState: BaseViewState {
    var isLoading: Bool = false

    var dynamicData: String = ""
}

extension ModuleCakeViewState {
    func changing(dynamicData: String) -> Self {
        var copy = copyMe()
        copy.dynamicData = dynamicData
        return copy
    }
}
