//
//  MoreViewAction.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 9/1/22.
//  
//

enum MoreViewAction {
    case onBack
    case onScreenTime(Int)
}

extension MoreViewAction {
    var back: Void? {
        guard case .onBack = self else { return nil }
        return ()
    }
    var screenTime: Int? {
        guard case let .onScreenTime(time) = self else { return nil }
        return time
    }
}
