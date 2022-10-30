//
//  CoordinatesImpl.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 30/10/22.
//

public struct CoordinatesImpl: Coordinates {
    public let latitude: Double
    public let longitude: Double
}

extension CoordinatesImpl {
    init?(response: [Double]?) {
        guard
            let latitude = response?[safe: 0],
            let longitude = response?[safe: 1]
        else {
            assertionFailure("Cannot be unwrapped")
            return nil
        }
        self.init(
            latitude: latitude,
            longitude: longitude
        )
    }
}
