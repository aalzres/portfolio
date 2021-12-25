//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//

import Domain
import UserInterface

struct CakeRepresentable {
    let item: CakeItem
    let title: String
    let description: String
    let image: ImageRepresentable
}

extension CakeRepresentable: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(description)
        hasher.combine(description)
    }

    static func == (lhs: CakeRepresentable, rhs: CakeRepresentable) -> Bool {
        lhs.title == rhs.title &&
        lhs.image == rhs.image &&
        lhs.description == rhs.description
    }
}
