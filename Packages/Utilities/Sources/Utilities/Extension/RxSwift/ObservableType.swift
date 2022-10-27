//
//  ObservableType.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/8/22.
//

import RxSwift

extension ObservableType {
    public func mapToVoid() -> Observable<Void> {
        map { _ in }
    }
    public func mapCast<T>(_ type: T.Type) -> Observable<T> {
        map { $0 as? T }.unwrap()
    }
    public func unwrap<Result>() -> Observable<Result> where Element == Result? {
        return self.compactMap { $0 }
    }
}
