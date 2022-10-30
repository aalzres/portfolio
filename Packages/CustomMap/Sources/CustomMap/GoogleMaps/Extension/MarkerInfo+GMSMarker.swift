//
//  MarkerInfo+GMSMarker.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 30/10/22.
//

import GoogleMaps

extension MarkerInfo {
    var asGMSMarker: GMSMarker {
        GMSMarker(position: position.toCLLocationCoordinate2D)
    }
}
