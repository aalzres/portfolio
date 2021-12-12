//
//  ModuleCakeViewState.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 11/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

import Architecture
import UserInterface

struct ModuleCakeViewState: BaseViewState {
    var alert: AlertRepresentable? = nil
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
