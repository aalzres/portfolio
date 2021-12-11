//
//  BaseCommander.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/12/21.
//

import RxSwift

open class BaseCommander {
    public let disposeBag = DisposeBag()
    public var commands: [BaseCommand] = []
    public var operations: [BaseOperation] = []

    public init() { }

    deinit {
        BaseDeinit.shared.printDeinit(self)
    }
}
