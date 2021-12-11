//
//  ModuleCakeViewAction.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 11/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

enum ModuleCakeViewAction {
    case onBack
    case onScreenTime(Int)
}

extension ModuleCakeViewAction {
    var back: Void? {
        guard case .onBack = self else { return nil }
        return ()
    }
    var screenTime: Int? {
        guard case let .onScreenTime(time) = self else { return nil }
        return time
    }
}
