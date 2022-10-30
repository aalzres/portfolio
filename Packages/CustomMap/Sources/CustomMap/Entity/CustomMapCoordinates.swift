//
//  CustomMapCoordinates.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 30/10/22.
//

import CoreLocation

struct CustomMapCoordinates {
    let latitude: Double
    let longitude: Double
}

extension CustomMapCoordinates {
    var toCLLocationCoordinate2D: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude
        )
    }
}
