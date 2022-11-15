//
//  EverythingMapResponse.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 30/10/22.
//

public struct EverythingMapResponse: Decodable {
    let elements: [ElementResponse]?
    let routes: [RouteResponse]
    let lastUpdatedTime: String?
    let tileBoundingBox: TileBoundingBoxResponse?

    enum CodingKeys: String, CodingKey {
        case elements
        case routes
        case lastUpdatedTime = "last_updated_time"
        case tileBoundingBox = "tile_bounding_box"
    }
}

struct EverythingMapImpl: EverythingMap {
    let mapElements: [MapElement]
}

extension EverythingMapImpl {
    init?(response: EverythingMapResponse) {
        guard
            let mapElements = response.elements?.compactMap(MapElementImpl.init)
        else {
            assertionFailure("Cannot be unwrapped")
            return nil
        }
        self.init(
            mapElements: mapElements
        )
    }
}
