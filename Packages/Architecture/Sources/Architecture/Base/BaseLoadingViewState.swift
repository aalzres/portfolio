//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/12/21.
//

public protocol BaseLoadingViewState: BaseResetViewState {
    var isLoading: Bool { get set }
    func changing(isLoading: Bool) -> Self
}

public extension BaseLoadingViewState {
    func changing(isLoading: Bool) -> Self {
        var copy = copyMe()
        copy.isLoading = isLoading
        return copy
    }
}
