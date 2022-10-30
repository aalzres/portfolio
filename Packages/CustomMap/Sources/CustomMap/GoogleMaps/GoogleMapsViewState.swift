//
//  CustomMapViewState.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 30/10/22.
//

import Utilities

struct GoogleMapsViewState: Modifiable {
    var userLocation: CustomMapCoordinates?
    var mapCentre: CustomMapCoordinates?
    var zoom: Float?
    var userLocationEnable: Bool = false
    var markers: [MarkerInfo] = []
}
