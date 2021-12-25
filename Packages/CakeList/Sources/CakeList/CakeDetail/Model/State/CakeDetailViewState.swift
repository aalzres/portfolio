//
//  CakeDetailViewState.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 24/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

import Architecture
import UserInterface

struct CakeDetailViewState: BaseViewState {
    var isLoading: Bool = false
    var alert: AlertRepresentable?
    
    var cakeRepresentable: CakeRepresentable?
}

extension CakeDetailViewState {
    func changing(cakeRepresentable: CakeRepresentable) -> Self {
        var copy = copyMe()
        copy.cakeRepresentable = cakeRepresentable
        return copy
    }
}
