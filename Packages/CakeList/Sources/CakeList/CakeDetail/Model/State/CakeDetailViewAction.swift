//
//  CakeDetailViewAction.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 24/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

enum CakeDetailViewAction {
    case onBack
    case onScreenTime(Int)
    case onGetCakeDetail
}

extension CakeDetailViewAction {
    var back: Void? {
        guard case .onBack = self else { return nil }
        return ()
    }
    var screenTime: Int? {
        guard case let .onScreenTime(time) = self else { return nil }
        return time
    }
    var getCakeDetail: Void? {
        guard case .onGetCakeDetail = self else { return nil }
        return ()
    }
}
