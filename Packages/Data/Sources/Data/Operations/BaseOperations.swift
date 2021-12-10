//
//  BaseOperation.swift
//  SHEP
//
//  Created by Andres Felipe Alzate Restrepo on 05/07/2020.
//
//  Copyright © 2019 aalzres. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

import Domain

typealias JSON = SwiftyJSON.JSON

private enum OperationError: Error {
    case nilResponse
    case unDecodable
}

public protocol BaseOperation {
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

open class BasicOperation<T>: BaseOperation {
    public var serverHost: ServerHost { return .unowned }
    public var endpoint: String { return "" }
    public var method: HTTPMethod { return .get }
    public var headers: [String : String] { return multipartHeader }
    public var params: Parameters { return [:] }
    public var imageParams: [UIImage] { return [] }
    public var encoding: ParameterEncoding {
        switch method {
        case .get:                          return URLEncoding.queryString
        case .post, .put, .delete, .patch:  return JSONEncoding.default
        default:                            return URLEncoding.default
        }
    }
    public var mimeType: String { return "" }
    public var needAuthorization: Bool { return false }
    public var canHandleAuthError: Bool { return false }
    public var canRetryOnError: Bool { return false }
    
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

open class JSONOperation<T: Codable>: BasicOperation<Data?> {
    public override var mimeType: String { return "application/json" }
    
    public override func handleResponse(response: Data?) -> Any? {
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
