//
//  BaseCommander.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/12/21.
//

import RxSwift

open class BaseCommander: ReactiveCompatible {
    public var commands: [BaseCommand] = []
    public var operations: [BaseOperation] = []
    public var reducer: [BaseReducer] = []

    public init() { }

    deinit {
        BaseDeinit.shared.printDeinit(self)
    }
}
