//
//  Modifiable.swift
//  Utilities
//
//  Created by Andres Felipe Alzate Restrepo on 5/12/21.
//

import Foundation

public protocol Modifiable {}
public extension Modifiable {
    @discardableResult
    func set<T>(_ keyPath: ReferenceWritableKeyPath<Self, T>, _ value: T) -> Self {
        self[keyPath: keyPath] = value
        return self
    }
}
