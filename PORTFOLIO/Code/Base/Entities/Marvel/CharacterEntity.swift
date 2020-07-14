//
//  CharacterEntity.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 10/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

struct CharactersDataWrapperEntity: Codable {
    /// The HTTP status code of the returned result
    let code: Int?
    /// A string description of the call status
    let status: String?
    /// The copyright notice for the returned result
    let copyright: String?
    /// The attribution notice for this result. Please display either this notice or the contents of the attributionHTML field on all screens which contain data from the Marvel Comics API
    let attributionText: String?
    /// An HTML representation of the attribution notice for this result. Please display either this notice or the contents of the attributionText field on all screens which contain data from the Marvel Comics API
    let attributionHTML: String?
    /// The results returned by the call
    let data: CharacterDataContainerEntity?
    /// A digest value of the content returned by the call
    let etag: String?
}

struct CharacterDataContainerEntity: Codable {
    /// The requested offset (number of skipped results) of the call
    let offset: Int?
    /// The requested result limit
    let limit: Int?
    /// The total number of resources available given the current filter set
    let total: Int?
    /// The total number of results returned by this call
    let count: Int?
    /// The list of characters returned by the call
    var results: [CharacterEntity]?
}

struct CharacterEntity: Codable {
    /// The unique ID of the character resource
    let id: Int?
    /// The name of the character
    var name: String?
    /// A short bio or description of the character
    let description: String?
    /// The date the resource was most recently modified
    let modified: Date?
    /// The canonical URL identifier for this resource
    let resourceURI: String?
    /// A set of public web site URLs for the resource
    let urls: [UrlEntity]?
    /// The representative image for this character
    let thumbnail: ImageEntity?
    /// A resource list containing comics which feature this character
    let comics: ComicListEntity?
    /// A resource list of stories in which this character appears
    let stories: StoryListEntity?
    /// A resource list of events in which this character appears
    let events: EventListEntity?
    /// A resource list of series in which this character appears
    let series: SeriesListEntity?
}

struct CharacterRequestEntity {
    /// Return only characters matching the specified full character name (e.g. Spider-Man)
    var name: String?
    /// Return characters with names that begin with the specified string (e.g. Sp)
    var nameStartsWith: String?
    /// Return only characters which have been modified since the specified date
    var modifiedSince: Date?
    /// Return only characters which appear in the specified comics (accepts a comma-separated list of ids)
    var comics: Int?
    /// Return only characters which appear the specified series (accepts a comma-separated list of ids)
    var series: Int?
    /// Return only characters which appear in the specified events (accepts a comma-separated list of ids)
    var events: Int?
    /// Return only characters which appear the specified stories (accepts a comma-separated list of ids)
    var stories: Int?
    /// Order the result set by a field or fields. Add a "-" to the value sort in descending order. Multiple values are given priority in the order in which they are passed
    var orderBy: CharacterOrderBy?
    /// Limit the result set to the specified number of resources.
    var limit: Int? = 40
    /// The requested offset (number of skipped results) of the call
    var offset: Int?
}

enum CharacterOrderBy: String {
    case nameASC = "name"
    case nameDESC = "-name"
    case modifiedASC = "modified"
    case modifiedDESC = "-modified"
}
