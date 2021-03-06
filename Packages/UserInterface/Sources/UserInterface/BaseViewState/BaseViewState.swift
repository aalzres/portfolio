//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/12/21.
//

public protocol BaseViewState: BaseLoadingViewState, BaseAlertViewState { }

public extension BaseViewState {
    mutating func reset() {
        alert = nil
    }
}
