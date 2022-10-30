//
//  NSError+.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 30/10/22.
//

import Foundation

extension NSError {
    static var errorToReadURLComponents: NSError {
        NSError(
            domain: "Fail to read urlComponents",
            code: 404,
            userInfo: nil
        )
    }
    static var errorToReadURL: NSError {
        NSError(
            domain: "Fail to read urlComponents.url",
            code: 404,
            userInfo: nil
        )
    }
}
