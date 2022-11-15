//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 29/10/22.
//

import CoreLocation

public protocol LocationDesiredAccuracy {
    var accuracy: CLLocationAccuracy { get }
}

extension LocationDesiredAccuracy where Self == LocationDesiredAccuracyImpl {
    public static var high: Self {
        LocationDesiredAccuracyImpl(accuracy: kCLLocationAccuracyBestForNavigation)
    }
    public static var medium: Self {
        LocationDesiredAccuracyImpl(accuracy: kCLLocationAccuracyNearestTenMeters)
    }
    public static var down: Self {
        LocationDesiredAccuracyImpl(accuracy: kCLLocationAccuracyHundredMeters)
    }
}

public class LocationDesiredAccuracyImpl: LocationDesiredAccuracy {
    public var accuracy: CLLocationAccuracy

    init(accuracy: CLLocationAccuracy) {
        self.accuracy = accuracy
    }
}
