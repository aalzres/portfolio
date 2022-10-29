//
//  Coordinates.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 29/10/22.
//

import CoreLocation

public protocol Coordinates {
    var latitude: Float { get }
    var longitude: Float { get }
}

public struct CoordinatesImpl: Coordinates {
    public let latitude: Float
    public let longitude: Float
}

extension CoordinatesImpl {
    init(coordinates: CLLocationCoordinate2D) {
        self.init(
            latitude: Float(coordinates.latitude),
            longitude: Float(coordinates.longitude)
        )
    }
}
