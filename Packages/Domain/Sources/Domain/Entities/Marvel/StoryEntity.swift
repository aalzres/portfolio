//
//  StoryEntity.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 12/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

public struct StoryListEntity: Codable {
    /// The number of total available stories in this list. Will always be greater than or equal to the "returned" value
    public let available: Int?
    /// The number of stories returned in this collection (up to 20)
    public let returned: Int?
    /// The path to the full list of stories in this collection
    public let collectionURI: String?
    /// The list of returned stories in this collection
    public let items: [StorySummaryEntity]?
}

public struct StorySummaryEntity: Codable {
    /// The path to the individual story resource
    public let resourceURI: String?
    /// The canonical name of the story
    public let name: String?
    /// The type of the story (interior or cover)
    public let type: String?
}
