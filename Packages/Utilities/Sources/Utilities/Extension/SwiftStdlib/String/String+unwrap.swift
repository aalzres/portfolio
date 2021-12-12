//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//

extension Optional where Wrapped == String {
    public func unwrap(_ defaultValue: String = "") -> String { self ?? defaultValue }
}
