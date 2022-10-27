//
//  MoreViewState.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 9/1/22.
//  
//

import UserInterface

struct MoreViewState: BaseViewState {
    var isLoading: Bool = false
    var alert: AlertRepresentable?

    var dynamicData: String = ""
}

extension MoreViewState {
    func changing(dynamicData: String) -> Self {
        var copy = copyMe()
        copy.dynamicData = dynamicData
        return copy
    }
}
