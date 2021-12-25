//
//  BaseInteractor.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/12/21.
//

import RxSwift

open class BaseInteractor: ReactiveCompatible {
    public init() {}

    deinit {
        BaseDeinit.shared.printDeinit(self)
    }
}
