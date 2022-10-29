//
//  BaseReducer.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/8/22.
//

open class BaseReducer {
    public init() {}

    deinit {
        BaseDeinit.shared.printDeinit(self)
    }
}
