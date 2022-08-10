//
//  Result+.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 10/8/22.
//

extension Result {
    var success: Success? {
        guard case let .success(value) = self else { return nil }
        return value
    }
    var failure: Failure? {
        guard case let .failure(error) = self else { return nil }
        return error
    }
}
