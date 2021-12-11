//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/12/21.
//

import RxCocoa

extension SharedSequence {
    public func unwrap<Result>() -> SharedSequence<SharingStrategy, Result> where Element == Result? {
        filter { $0 != nil }.map { $0! }
    }
}
