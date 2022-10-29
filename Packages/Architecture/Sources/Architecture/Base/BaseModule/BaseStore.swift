//
//  BaseStore.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 29/10/22.
//

open class BaseStore {
    public init() {}

    deinit {
        BaseDeinit.shared.printDeinit(self)
    }
}
