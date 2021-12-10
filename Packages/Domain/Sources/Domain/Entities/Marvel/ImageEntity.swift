//
//  ImageEntity.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 12/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

public struct ImageEntity: Codable {
    /// The directory path of to the image
    public let path: String
    /// The file extension for the image
    public let `extension`: String
}
