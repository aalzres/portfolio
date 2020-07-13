//
//  SeriesEntity.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 12/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

struct SeriesListEntity: Codable {
    /// The number of total available series in this list. Will always be greater than or equal to the "returned" value
    let available: Int?
    /// The number of series returned in this collection (up to 20)
    let returned: Int?
    /// The path to the full list of series in this collection
    let collectionURI: String?
    /// The list of returned series in this collection
    let items: [SeriesSummaryEntity]?
}

struct SeriesSummaryEntity: Codable {
    /// The path to the individual series resource
    let resourceURI: String?
    /// The canonical name of the series
    let name: String?
}
