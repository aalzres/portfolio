//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 30/10/22.
//

public struct RouteResponse: Decodable {
    let name: String?
    let color: String?
    let textColor: String?
    let uiColor: String?
    let id: String?
    let brandID: String?
    let longName: String?
    let mode: String?
    let affinities: [String]?
    let tileSets: [String]?

    enum CodingKeys: String, CodingKey {
        case name, color
        case textColor = "text_color"
        case uiColor = "ui_color"
        case id
        case brandID = "brand_id"
        case longName = "long_name"
        case mode, affinities
        case tileSets = "tile_sets"
    }
}
