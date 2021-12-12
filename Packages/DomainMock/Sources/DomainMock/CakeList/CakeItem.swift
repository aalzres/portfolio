//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//

import Domain

struct CakeItemMock: CakeItem {
    var title: String
    var description: String
    var image: String

    static let caseA = CakeItemMock(
        title: "Lemon cheesecake",
        description: "A cheesecake made of lemon",
        image: "https://s3-eu-west-1.amazonaws.com/s3.mediafileserver.co.uk/carnation/WebFiles/RecipeImages/lemoncheesecake_lg.jpg"
    )
    static let caseB = CakeItemMock(
        title: "victoria sponge",
        description: "sponge with jam",
        image: "https://upload.wikimedia.org/wikipedia/commons/0/05/111rfyh.jpg"
    )
}
