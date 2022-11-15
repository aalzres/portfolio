//
//  CustomMapCoordinates+CLLocationCoordinate2D.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 30/10/22.
//

import CoreLocation

extension CustomMapCoordinates {
    var toCLLocationCoordinate2D: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude
        )
    }
}
