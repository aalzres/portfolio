//
//  UrlEntity.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 12/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

struct UrlEntity: Codable {
    /// A text identifier for the URL
    let type: String
    /// A full URL (including scheme, domain, and path)
    let url: String
}
