//
//  BaseCommand.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/12/21.
//

import RxSwift

open class BaseCommand {
    public var disposeBag = DisposeBag()
    public init() {}
    deinit {
        BaseDeinit.shared.printDeinit(self)
    }
}
