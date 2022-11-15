//
//  LocationManger.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 29/10/22.
//

import Combine
import CoreLocation

public protocol LocationManager {
    var didUpdateLocations: AnyPublisher<[CLLocationCoordinate2D], Error> { get }
    var didUpdateLastLocation: AnyPublisher<CLLocationCoordinate2D, Error> { get }
    var authorizationStatus: AnyPublisher<CLAuthorizationStatus, Error> { get }

    func getAuthorizationStatus() -> CLAuthorizationStatus
    func set(desiredAccuracy: LocationDesiredAccuracy)

    func startUpdatingLocation()
    func stopUpdatingLocation()

    func requestWhenInUseAuthorization()
}

public final class LocationManagerImpl: NSObject, LocationManager {
    private let locationManager: CLLocationManager
    private let didUpdateLastLocationSubject = PassthroughSubject<CLLocationCoordinate2D, Error>()
    public var didUpdateLastLocation: AnyPublisher<CLLocationCoordinate2D, Error> {
        didUpdateLastLocationSubject.eraseToAnyPublisher()
    }
    private let didUpdateLocationsSubject = PassthroughSubject<[CLLocationCoordinate2D], Error>()
    public var didUpdateLocations: AnyPublisher<[CLLocationCoordinate2D], Error> {
        didUpdateLocationsSubject.eraseToAnyPublisher()
    }
    private let authorizationStatusSubject = PassthroughSubject<CLAuthorizationStatus, Error>()
    public var authorizationStatus: AnyPublisher<CLAuthorizationStatus, Error> {
        authorizationStatusSubject.eraseToAnyPublisher()
    }

    public init(
        coreLocationManager: CLLocationManager
    ) {
        locationManager = coreLocationManager
        super.init()
        setup()
    }

    private func setup() {
        locationManager.delegate = self
    }

    public func set(desiredAccuracy: LocationDesiredAccuracy) {
        locationManager.desiredAccuracy = desiredAccuracy.accuracy
    }

    public func getAuthorizationStatus() -> CLAuthorizationStatus {
        if #available(iOS 14, *) {
            return locationManager.authorizationStatus
        } else {
            return CLLocationManager.authorizationStatus()
        }
    }

    public func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }

    public func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
    }

    public func requestWhenInUseAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }
}

extension LocationManagerImpl: CLLocationManagerDelegate {
    public func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        didUpdateLocationsSubject.send(locations.map(\.coordinate))
        if let lastLocation = locations.map(\.coordinate).last {
            didUpdateLastLocationSubject.send(lastLocation)
        }
    }

    public func locationManager(
        _ manager: CLLocationManager,
        didFailWithError error: Error
    ) {
        didUpdateLocationsSubject.send(completion: .failure(error))
        didUpdateLastLocationSubject.send(completion: .failure(error))
        authorizationStatusSubject.send(completion: .failure(error))
    }

    public func locationManagerDidChangeAuthorization(
        _ manager: CLLocationManager
    ) {
        if #available(iOS 14, *) {
            authorizationStatusSubject.send(getAuthorizationStatus())
        }
    }

    public func locationManager(
        _ manager: CLLocationManager,
        didChangeAuthorization status: CLAuthorizationStatus
    ) {
        if #available(*, iOS 14) {
            authorizationStatusSubject.send(getAuthorizationStatus())
        }
    }
}
