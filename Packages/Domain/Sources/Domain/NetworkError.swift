//
//  NetworkError.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 11/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Alamofire
import Utilities

public struct NetworkErrorEntity: Error {
    public let code: Int
    public let errorDescription: String
    public var response: Any? = nil
    
    public static func fromError(_ error: Error, response: Any? = nil) -> NetworkErrorEntity? {
        guard
            let code = error.asAFError?.responseCode,
            let errorDescription = error.asAFError?.errorDescription else {
            return nil
        }
        
        return NetworkErrorEntity(code: code, errorDescription: errorDescription, response: response)
    }
    
    public static let genericError = NetworkErrorEntity(code: -2222, errorDescription: "error_generic".localized())
    public static let wrongDataError = NetworkErrorEntity(code: -2220, errorDescription: "error_wrong_data".localized())
    public static let parametersError = NetworkErrorEntity(code: 409, errorDescription: "error_parameters".localized())
}
