//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/12/21.
//

import Utilities

public protocol BaseViewState: BaseLoadingViewState, BaseAlertViewState, Modifiable { }

public extension Modifiable where Self: BaseViewState {
    @discardableResult
    func changing<T>(_ keyPath: KeyPath<Self, T>, _ value: T) -> Self {
        copyMe().set(keyPath, value)
    }

    mutating func reset() {
        alert = nil
    }
}
