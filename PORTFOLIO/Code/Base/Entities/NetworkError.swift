//
//  NetworkError.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 11/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

struct NetworkErrorEntity: Error {
    let code: Int
    let errorDescription: String
    var response: Any? = nil
    
    static func fromError(_ error: Error, response: Any? = nil) -> NetworkErrorEntity? {
        guard
            let code = error.asAFError?.responseCode,
            let errorDescription = error.asAFError?.errorDescription else {
            return nil
        }
        
        return NetworkErrorEntity(code: code, errorDescription: errorDescription, response: response)
    }
    
    static let genericError = NetworkErrorEntity(code: -2222, errorDescription: "error_generic".localized())
    static let wrongDataError = NetworkErrorEntity(code: -2220, errorDescription: "error_wrong_data".localized())
    static let parametersError = NetworkErrorEntity(code: 409, errorDescription: "error_parameters".localized())
}
