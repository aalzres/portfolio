//
//  BaseViewAction.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/8/22.
//

import RxSwift

public protocol BaseViewAction {
    init(lifeCycle: UIViewControllerLyfeCycle)
}

extension Observable where Element == UIViewControllerLyfeCycle {
    public func asViewAction<ViewAction: BaseViewAction>() -> Observable<ViewAction> {
        map(ViewAction.init)
    }
}
