//
//  ResourceEntity.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 16/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import UIKit

public struct ResourceEntity: Codable {
    public let id: String
    public let name: String
    public let xFrame: Double?
    public let yFrame: Double?
    public let scheduledArrival: Int?
    public let locationType: Int?
    public let companyZoneId: Int
    public let latitude: Double?
    public let longitude: Double?

    enum CodingKeys: String, CodingKey {
        case xFrame = "x"
        case yFrame = "y"
        case latitude = "lat"
        case longitude = "lon"
        case id, name, scheduledArrival, locationType, companyZoneId
    }
    
    public var color: UIColor {
        switch self.companyZoneId {
        case 382:
            return .systemBlue
        case 378:
            return .systemGray
        case 402:
            return .systemOrange
        default:
            return .red
        }
    }
}

public struct ResourceParamsEntity {
    public var lowerLeft: Coordinates? = nil
    public var upperRight: Coordinates? = nil
    public init() {}
}
