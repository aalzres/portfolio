//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/12/21.
//

import RxSwift

extension ObservableType {
    public func mapTo<Result>(_ value: Result) -> Observable<Result> {
        map { _ in value }
    }
}

extension PrimitiveSequence where Trait == SingleTrait {
    public func mapTo<Result>(_ value: Result) -> Single<Result> {
        map { _ in value }
    }
}

extension PrimitiveSequence where Trait == MaybeTrait {
    public func mapTo<Result>(_ value: Result) -> Maybe<Result> {
        map { _ in value }
    }
}
