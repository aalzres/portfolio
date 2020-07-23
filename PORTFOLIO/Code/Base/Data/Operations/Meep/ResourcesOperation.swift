//
//  ResourcesOperation.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 16/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation
import Alamofire

class ResourcesOperation: JSONOperation<[ResourceEntity]> {
    override var serverHost: ServerHost { return .meep }
    override var endpoint: String { return "/routers/lisboa/resources" }
    override var method: HTTPMethod { return .get }
    override var params: Parameters {
        var params = ["": ""]
        if let lowerLeftLat = resourceParams?.lowerLeft?.lat, let lowerLeftLon = resourceParams?.lowerLeft?.lon,
            let upperRightLat = resourceParams?.upperRight?.lat, let upperRightLon = resourceParams?.upperRight?.lon {
            params["lowerLeftLatLon"] = "\(lowerLeftLat),\(lowerLeftLon)"
            params["upperRightLatLon"] = "\(upperRightLat),\(upperRightLon)"
        }
        return params
    }
    
    private var resourceParams: ResourceParamsEntity?
    
    init(resourceParams: ResourceParamsEntity? = nil, completionSuccess: @escaping (Any?) -> Void, completionFailure: @escaping (NetworkErrorEntity) -> Void) {
        self.resourceParams = resourceParams
        
        super.init(completionSuccess: completionSuccess, completionFailure: completionFailure)
    }
}
