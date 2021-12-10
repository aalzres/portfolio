//
//  ComicEntity.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 12/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

public struct ComicListEntity: Codable {
    /// The number of total available issues in this list. Will always be greater than or equal to the "returned" value
    public let available: Int?
    /// The number of issues returned in this collection (up to 20)
    public let returned: Int?
    /// The path to the full list of issues in this collection
    public let collectionURI: String?
    /// // The list of returned issues in this collection
    public let items: [ComicSummaryEntity]?
}

public struct ComicSummaryEntity: Codable {
    /// The path to the individual comic resource
    public let resourceURI: String?
    /// The canonical name of the comic
    public let name: String?
}
