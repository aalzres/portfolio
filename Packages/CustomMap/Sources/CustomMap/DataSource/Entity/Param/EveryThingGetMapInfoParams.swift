//
//  EveryThingGetMapInfoParams.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 30/10/22.
//

import Utilities
import Foundation

public struct EveryThingGetMapInfoParams {
    let location: Coordinates
    let size: String = "small"
    let sizeDevice: String = "ios"
}

extension EveryThingGetMapInfoParams: AsQueryItems {
    public var asQueryItems: [URLQueryItem] {[
        URLQueryItem(name: "location", value: "\(location.latitude),\(location.longitude)"),
        URLQueryItem(name: "size", value: size),
        URLQueryItem(name: "size_class", value: sizeDevice)
    ]}
}
