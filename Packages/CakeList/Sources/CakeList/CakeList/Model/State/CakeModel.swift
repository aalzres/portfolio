//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//

import Domain

struct CakeRepresentable {
    let item: CakeItem
    let title: String
    let description: String
    let imageUrl: String
}

extension CakeRepresentable: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(description)
        hasher.combine(description)
    }

    static func == (lhs: CakeRepresentable, rhs: CakeRepresentable) -> Bool {
        lhs.title == rhs.title &&
        lhs.imageUrl == rhs.imageUrl &&
        lhs.description == rhs.description
    }
}
