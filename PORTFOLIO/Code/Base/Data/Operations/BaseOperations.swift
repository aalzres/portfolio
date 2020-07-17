//
//  BaseOperation.swift
//  SHEP
//
//  Created by Andres Felipe Alzate Restrepo on 05/07/2020.
//
//  Copyright © 2019 aalzres. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias JSON = SwiftyJSON.JSON

private enum OperationError: Error {
    case nilResponse
    case unDecodable
}

protocol BaseOperation {
    var serverHost: ServerHost { get }
    var endpoint: String { get }
    var method: HTTPMethod { get }
    var headers: [String : String] { get }
    var params: Parameters { get }
    var encoding: ParameterEncoding { get }
    var mimeType: String { get }
    var needAuthorization: Bool { get }
    var canRetryOnError: Bool { get }
}

class BasicOperation<T>: BaseOperation {
    var serverHost: ServerHost { return .unowned }
    var endpoint: String { return "" }
    var method: HTTPMethod { return .get }
    var headers: [String : String] { return multipartHeader }
    var params: Parameters { return [:] }
    var imageParams: [UIImage] { return [] }
    var encoding: ParameterEncoding {
        switch method {
        case .get:                          return URLEncoding.queryString
        case .post, .put, .delete, .patch:  return JSONEncoding.default
        default:                            return URLEncoding.default
        }
    }
    var mimeType: String { return "" }
    var needAuthorization: Bool { return false }
    var canHandleAuthError: Bool { return false }
    var canRetryOnError: Bool { return false }
    
    var isMultipart: Bool { return !imageParams.isEmpty }
    fileprivate var multipartHeader: [String : String] { return isMultipart ?
        ["Content-type": "multipart/form-data",
         "Content-Disposition" : "form-data"] :
        [:]
    }
    
    internal var success: (Any?) -> Void
    internal var failure: (NetworkErrorEntity) -> Void
    
    init(completionSuccess: @escaping (Any?) -> Void, completionFailure: @escaping(NetworkErrorEntity) -> Void) {
        self.success = completionSuccess
        self.failure = completionFailure
    }
    
    func handleResponse(response: T) -> Any? { return response }
    
    func handleError(response: T) -> Any? { return response }
}

class JSONOperation<T: Codable>: BasicOperation<Data?> {
    override var mimeType: String { return "application/json" }
    
    override func handleResponse(response: Data?) -> Any? {
        do {
            guard let response = response else { throw OperationError.nilResponse }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            return try decoder.decode(T.self, from: response)
        } catch {
            debugPrint("DecodingError: \(error)")
            return nil
        }
    }
}

class PORTFOLIOOperation<T: Codable>: JSONOperation<T> {}
