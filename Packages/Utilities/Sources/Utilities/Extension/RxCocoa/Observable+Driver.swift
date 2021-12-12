//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/12/21.
//

import RxSwift
import RxSwift
import RxCocoa

extension Observable {
     public func asDriverIgnoringErrors() -> Driver<Element> {
        map { $0 as Element? }
        .asDriver(onErrorJustReturn: nil)
        .unwrap()
    }
}
