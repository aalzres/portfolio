//
//  ImageEntity.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 12/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

struct ImageEntity: Codable {
    /// The directory path of to the image
    let path: String
    /// The file extension for the image
    let `extension`: String
}
