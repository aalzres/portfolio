//
//  BaseCoordinator.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/12/21.
//

import RxSwift

open class BaseCoordinator: ReactiveCompatible {
    public let router: Router

    public init(router: Router) {
        self.router = router
    }

    deinit {
        BaseDeinit.shared.printDeinit(self)
    }
}
