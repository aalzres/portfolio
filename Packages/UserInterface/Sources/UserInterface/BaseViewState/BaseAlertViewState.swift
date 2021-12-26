//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//

import UserInterface

public protocol BaseAlertViewState: BaseResetViewState {
    var alert: AlertRepresentable? { get set }
    func changing(alert: AlertRepresentable?) -> Self
}

public extension BaseAlertViewState {
    func changing(alert: AlertRepresentable?) -> Self {
        var copy = copyMe()
        copy.alert = alert
        return copy
    }
}
