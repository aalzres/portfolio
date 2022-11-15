//
//  LocationUseCase.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 29/10/22.
//

import Combine
import Utilities
import CoreLocation

public protocol LocationUseCase {
    func startLocation()
    func stopLocation()
    var didUpdateLastLocation: AnyPublisher<Coordinates, Error> { get }
}

public final class LocationUseCaseImpl: LocationUseCase {
    private let locationManager: LocationManager
    private var cancellable: AnyCancellable?

    public var didUpdateLastLocation: AnyPublisher<Coordinates, Error> {
        locationManager.didUpdateLastLocation
            .map(CoordinatesImpl.init)
            .eraseToAnyPublisher()
    }

    public init(locationManager: LocationManager) {
        self.locationManager = locationManager
        self.locationManager.set(desiredAccuracy: .high)
    }

    public func startLocation() {
        bindAuthorizationStatus()
    }

    private func bindAuthorizationStatus() {
        cancellable = locationManager
            .authorizationStatus
            .sink(receiveCompletion: { [weak self] _ in self?.stopLocation() }, receiveValue: manage)
    }

    public func stopLocation() {
        locationManager.stopUpdatingLocation()
        cancellable = nil
    }

    private func manage(authorizationStatus status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()

        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()

        case .denied, .restricted: break /// Pending TODO
        @unknown default:
            assertionFailure("Not defined yet")
        }
    }
}
