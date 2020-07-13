//
//  CharactersOperation.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 10/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation
import Alamofire

class CharactersOperation: JSONOperation<CharactersDataWrapperEntity> {
    override var endpoint: String { return "/public/characters" }
    override var method: HTTPMethod { return .get }
    override var params: Parameters {
        var params = ["" : ""]
        if let name = characterRequest?.name { params["name"] = name }
        if let offset = characterRequest?.offset { params["offset"] = String(offset) }
        if let limit = characterRequest?.limit { params["limit"] = String(limit) }
        
        return params
    }
    
    private var characterRequest: CharacterRequestEntity?
    
    init(characterRequest: CharacterRequestEntity? = nil, completionSuccess: @escaping (Any?) -> Void, completionFailure: @escaping (NetworkErrorEntity) -> Void) {
        self.characterRequest = characterRequest
        
        super.init(completionSuccess: completionSuccess, completionFailure: completionFailure)
    }
}
