//
//  BaseReducer.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/8/22.
//

import RxSwift

open class BaseReducer: ReactiveCompatible {
    public init() {}

    deinit {
        BaseDeinit.shared.printDeinit(self)
    }
}
