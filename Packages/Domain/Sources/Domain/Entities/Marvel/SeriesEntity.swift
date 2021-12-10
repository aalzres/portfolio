//
//  SeriesEntity.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 12/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

public struct SeriesListEntity: Codable {
    /// The number of total available series in this list. Will always be greater than or equal to the "returned" value
    public let available: Int?
    /// The number of series returned in this collection (up to 20)
    public let returned: Int?
    /// The path to the full list of series in this collection
    public let collectionURI: String?
    /// The list of returned series in this collection
    public let items: [SeriesSummaryEntity]?
}

public struct SeriesSummaryEntity: Codable {
    /// The path to the individual series resource
    public let resourceURI: String?
    /// The canonical name of the series
    public let name: String?
}
