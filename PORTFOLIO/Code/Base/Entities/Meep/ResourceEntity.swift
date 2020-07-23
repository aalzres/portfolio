//
//  ResourceEntity.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 16/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation
import UIKit

struct ResourceEntity: Codable {
    ///
    let id: String
    ///
    let name: String
    ///
    let xFrame: Double?
    ///
    let yFrame: Double?
    ///
    let scheduledArrival: Int?
    ///
    let locationType: Int?
    ///
    let companyZoneId: Int
    ///
    let latitude: Double?
    ///
    let longitude: Double?
    
    enum CodingKeys: String, CodingKey {
        case xFrame = "x"
        case yFrame = "y"
        case latitude = "lat"
        case longitude = "lon"
        case id, name, scheduledArrival, locationType, companyZoneId
    }
    
    var color: UIColor {
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

struct ResourceParamsEntity {
    ///
    var lowerLeft: Coordinates? = nil
    ///
    var upperRight: Coordinates? = nil
}
