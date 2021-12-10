//
//  ResourceParams+Extension.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 19/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Domain

// MARK: - Base on https://stackoverflow.com/questions/7477003/calculating-new-longitude-latitude-from-old-n-meters
extension ResourceParamsEntity {
    mutating func createFrame(coordinatesOrigin coords: Coordinates, multiplier: Double = 1) {
        self.upperRight = calculateFrame(coordinatesOrigin: coords, multiplier: multiplier)
        self.lowerLeft = calculateFrame(coordinatesOrigin: coords, multiplier: -multiplier )
    }

    func calculateFrame(coordinatesOrigin coords: Coordinates, multiplier: Double = 1 ) -> Coordinates {
        func calculateLatitude() -> Double {
            return coords.lat + ( multiplier * Constants.baseMultiplierLat / Constants.radiusEarth * Constants.radianToDegree)
        }

        func calculateLongitude() -> Double {
            return coords.lon + ( multiplier * Constants.baseMultiplierLon / Constants.radiusEarth * Constants.radianToDegree / cos(coords.lat * Constants.degreeToRadian))
        }

        return  Coordinates(lat: calculateLatitude(), lon: calculateLongitude())
    }
}
// MARK: - Constants
private struct Constants {
    static let baseMultiplierLat: Double = 1.5
    static let baseMultiplierLon: Double = 1
    static let radiusEarth: Double = 6378.160
    static let radianToDegree: Double = 180 / .pi
    static let degreeToRadian: Double = .pi / 180
}
