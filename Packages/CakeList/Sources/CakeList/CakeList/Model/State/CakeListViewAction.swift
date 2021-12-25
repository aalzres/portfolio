//
//  CakeListViewAction.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

enum CakeListViewAction {
    case onBack
    case onScreenTime(Int)
    case onGetCakeList
    case onTapCakeDetail(CakeRepresentable)
}

extension CakeListViewAction {
    var back: Void? {
        guard case .onBack = self else { return nil }
        return ()
    }
    var screenTime: Int? {
        guard case let .onScreenTime(time) = self else { return nil }
        return time
    }
    var getCakeList: Void? {
        guard case .onGetCakeList = self else { return nil }
        return ()
    }
    var tapCakeDetail: CakeRepresentable? {
        guard case let .onTapCakeDetail(representable) = self else { return nil }
        return representable
    }
}
