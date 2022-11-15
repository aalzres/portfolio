//
//  CoordinatesImpl+CLLocationCoordinate2D.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 30/10/22.
//

import CoreLocation

extension CoordinatesImpl {
    init(coordinates: CLLocationCoordinate2D) {
        self.init(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
}
