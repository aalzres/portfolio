//
//  CustomMapCoordinates+Coordinates.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 30/10/22.
//

extension CustomMapCoordinates {
    init(_ coordinates: Coordinates) {
        self.init(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
}
