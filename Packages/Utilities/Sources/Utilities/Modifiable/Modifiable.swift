//
//  Modifiable.swift
//  Utilities
//
//  Created by Andres Felipe Alzate Restrepo on 5/12/21.
//

public protocol Modifiable {}
public extension Modifiable {
    @discardableResult
    func set<T>(_ keyPath: KeyPath<Self, T>, _ value: T) -> Self {
        var copy = self
        guard let keyPath = keyPath as? WritableKeyPath else {
            assertionFailure("KeyPath not casteable to WritableKeyPath ")
            return copy
        }
        copy[keyPath: keyPath] = value
        return copy
    }
}
