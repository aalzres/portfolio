//
//  UrlEntity.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 12/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

public struct UrlEntity: Codable {
    /// A text identifier for the URL
    public let type: String
    /// A full URL (including scheme, domain, and path)
    public let url: String
}
