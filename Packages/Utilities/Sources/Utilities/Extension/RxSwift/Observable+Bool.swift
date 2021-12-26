//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 25/12/21.
//

import RxSwift

extension ObservableType where Element == Bool {
    public func not() -> Observable<Bool> {
        return self.map(!)
    }
}
