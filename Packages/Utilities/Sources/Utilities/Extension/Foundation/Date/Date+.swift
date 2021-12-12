//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/12/21.
//

import Foundation

extension Date {
    public var millisecondsDifferenceSinceNow: Int {
        (Date().timeIntervalSince(self) * 1000).int
    }
}
