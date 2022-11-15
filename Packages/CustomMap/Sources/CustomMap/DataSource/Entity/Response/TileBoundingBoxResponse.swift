//
//  TileBoundingBoxResponse.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 30/10/22.
//

public struct TileBoundingBoxResponse: Decodable {
    let northwestCornerCoords: [Double]
    let northeastCornerCoords: [Double]
    let southwestCornerCoords: [Double]
    let southeastCornerCoords: [Double]

    enum CodingKeys: String, CodingKey {
        case northwestCornerCoords = "northwest_corner_coords"
        case northeastCornerCoords = "northeast_corner_coords"
        case southwestCornerCoords = "southwest_corner_coords"
        case southeastCornerCoords = "southeast_corner_coords"
    }
}
