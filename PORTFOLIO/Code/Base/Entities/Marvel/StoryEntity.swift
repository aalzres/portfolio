//
//  StoryEntity.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 12/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

struct StoryListEntity: Codable {
    /// The number of total available stories in this list. Will always be greater than or equal to the "returned" value
    let available: Int?
    /// The number of stories returned in this collection (up to 20)
    let returned: Int?
    /// The path to the full list of stories in this collection
    let collectionURI: String?
    /// The list of returned stories in this collection
    let items: [StorySummaryEntity]?
}

struct StorySummaryEntity: Codable {
    /// The path to the individual story resource
    let resourceURI: String?
    /// The canonical name of the story
    let name: String?
    /// The type of the story (interior or cover)
    let type: String?
}
