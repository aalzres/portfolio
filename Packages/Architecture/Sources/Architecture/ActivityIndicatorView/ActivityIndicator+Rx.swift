//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/12/21.
//

import RxSwift
import RxCocoa

public extension Reactive where Base: ActivityIndicatorView {
    var loadingStatus: Binder<Bool> {
        Binder(base) { base, value in
            value ? base.start : base.stop
        }
    }
}
