//
//  BaseMiddleware.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 30/10/22.
//

open class BaseMiddleware {
    public init() {}

    deinit {
        BaseDeinit.shared.printDeinit(self)
    }
}
