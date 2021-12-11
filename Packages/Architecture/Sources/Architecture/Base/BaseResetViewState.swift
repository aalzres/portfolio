//
//  BaseResetViewState.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/12/21.
//

public protocol BaseResetViewState {
    func copyMe() -> Self
    mutating func reset()
}

public extension BaseResetViewState {
    func copyMe() -> Self {
        var copy = self
        copy.reset()
        return copy
    }
}
