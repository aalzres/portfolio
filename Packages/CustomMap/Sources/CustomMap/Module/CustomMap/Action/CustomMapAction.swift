//
//  CustomMapAction.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 29/10/22.
//

enum CustomMapAction {
    /// on
    case onAppear
    case onDisappear

    /// get

    /// set
    case setCoordinates(_ coordinates: Coordinates)
    case setMapInfo(_ mapInfo: [MapElement])
}
