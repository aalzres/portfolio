//
//  ComicEntity.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 12/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

struct ComicListEntity: Codable {
    /// The number of total available issues in this list. Will always be greater than or equal to the "returned" value
    let available: Int?
    /// The number of issues returned in this collection (up to 20)
    let returned: Int?
    /// The path to the full list of issues in this collection
    let collectionURI: String?
    /// // The list of returned issues in this collection
    let items: [ComicSummaryEntity]?
}

struct ComicSummaryEntity: Codable {
    /// The path to the individual comic resource
    let resourceURI: String?
    /// The canonical name of the comic
    let name: String?
}
