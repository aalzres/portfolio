//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/12/21.
//

import RxSwift

public extension PrimitiveSequence where Trait == SingleTrait {
    func mapResult<T>() -> Observable<T> {
        self
            .flatMap { result in
                switch result {
                case let result as Result<T, Error>:
                    switch result {
                    case .success(let value):
                        return .just(value)
                    case .failure(let error):
                        return .error(error)
                    }
                case let result as T:
                    return .just(result)
                default:
                    return .error(RxError.unknown)
                }
            }
            .asObservable()
    }
}
