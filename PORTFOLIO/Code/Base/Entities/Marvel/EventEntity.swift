//
//  EventEntity.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 12/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

struct EventListEntity: Codable {
    /// The number of total available events in this list. Will always be greater than or equal to the "returned" value
    let available: Int?
    /// The number of events returned in this collection (up to 20)
    let returned: Int?
    /// The path to the full list of events in this collection
    let collectionURI: String?
    /// The list of returned events in this collection
    let items: [EventSummaryEntity]?
}

struct EventSummaryEntity: Codable {
    /// The path to the individual event resource
    let resourceURI: String?
    /// The name of the event
    let name: String?
}
