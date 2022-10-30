//
//  ElementResponse.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 30/10/22.
//

public struct ElementResponse: Decodable {
    let coords: [Double]?
    let kind: String?
    let name: String?
    let indicator: String?
    let id: String?
    let routeNames: [String]?
    let routeIDS: [String]?
    let brandIDS: [String]?
    let advertisedBrandIDS: [String]?
    let bearing: String?
    let direction: String?
    let aliases: [String]?
    let tileSets: [String]?

    enum CodingKeys: String, CodingKey {
        case coords, kind, name, indicator, id
        case routeNames = "route_names"
        case routeIDS = "route_ids"
        case brandIDS = "brand_ids"
        case advertisedBrandIDS = "advertised_brand_ids"
        case bearing, direction, aliases
        case tileSets = "tile_sets"
    }
}

struct MapElementImpl: MapElement {
    let coordinates: Coordinates
    let name: String
    let indicator: String?
}

extension MapElementImpl {
    init?(response: ElementResponse) {
        guard
            let coordinates = CoordinatesImpl(response: response.coords),
            let name = response.name
        else {
            assertionFailure("Cannot be unwrapped")
            return nil
        }
        self.init(
            coordinates: coordinates,
            name: name,
            indicator: response.indicator
        )
    }
}
