//
//  CharactersOperation.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 10/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Domain
import Alamofire

public final class CharactersOperation: JSONOperation<CharactersDataWrapperEntity> {
    public override var serverHost: ServerHost { return .marvel }
    public override var endpoint: String { return "/public/characters" }
    public override var method: HTTPMethod { return .get }
    public override var params: Parameters {
        var params = ["": ""]
        if let name = characterParams?.name { params["name"] = name }
        if let nameStartsWith = characterParams?.nameStartsWith { params["nameStartsWith"] = nameStartsWith }
        if let offset = characterParams?.offset { params["offset"] = String(offset) }
        if let limit = characterParams?.limit { params["limit"] = String(limit) }
        
        return params
    }
    
    private var characterParams: CharacterParamsEntity?

    public init(
        characterParams: CharacterParamsEntity? = nil,
        completionSuccess: @escaping (Any?) -> Void,
        completionFailure: @escaping (NetworkErrorEntity) -> Void
    ) {
        self.characterParams = characterParams
        
        super.init(completionSuccess: completionSuccess, completionFailure: completionFailure)
    }
}
