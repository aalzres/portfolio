//
//  Coordinates.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 29/10/22.
//

import CoreLocation

public protocol Coordinates {
    var latitude: Double { get }
    var longitude: Double { get }
}

public struct CoordinatesImpl: Coordinates {
    public let latitude: Double
    public let longitude: Double
}

extension CoordinatesImpl {
    init(coordinates: CLLocationCoordinate2D) {
        self.init(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
}
