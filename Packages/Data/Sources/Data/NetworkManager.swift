//
//  NetworkManager.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 05/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation
import Alamofire

struct AnyResponse: Codable {}

// MARK: - Routing server host
public enum ServerHost { case marvel, unowned }

public protocol NetworkManager {
    func request(_ operation: BasicOperation<Data?>)
}

public class NetworkManagerImpl: NetworkManager {
    private let appConfiguration: AppConfiguration
    
    private var isConnectedToInternet: Bool? { return NetworkReachabilityManager()?.isReachable }
    
    public init(appConfiguration: AppConfiguration) {
        self.appConfiguration = appConfiguration
    }
    
    public func request(_ operation: BasicOperation<Data?>) {
        basicValidation(withOperation: operation).response { [weak self] response in
            switch response.result {
            case .success(let value):
                print("Operation Success: \(operation.endpoint)")
                let handleResponse = operation.handleResponse(response: value)
                operation.success(handleResponse)
            case .failure(let error):
                let handleErrorResponse = operation.handleError(response: response.data)
                self?.handleError(error, onOperation: operation, response: handleErrorResponse)
            }
        }
    }
    
    private func basicValidation<T>(withOperation operation: BasicOperation<T>) -> DataRequest {
        return request(withOperation: operation)
            .validate(statusCode: 200..<300)
            .validate(contentType: [operation.mimeType])
    }
    
    private func request<T>(withOperation operation: BasicOperation<T>) -> DataRequest {
        return simpleRequest(withOperation: operation)
    }
    
    private func simpleRequest<T>(withOperation operation: BasicOperation<T>) -> DataRequest {
        let serverHost = setupServerHost(serverHost: operation.serverHost, parameters: operation.params)
        
        let url = "\(serverHost.url)\(operation.endpoint)"
        let parameters = serverHost.params
        
        let debugMsg = "Execute \(operation.method.rawValue) => \(url) with Params: \(parameters)"
        print("\(operation.isMultipart ? "\(debugMsg) and is Multipart" : debugMsg)")
        
        return AF.request(url, method: operation.method, parameters: parameters, encoding: operation.encoding, headers: operationHeader(operation: operation))
    }
    
    private func operationHeader<T>(operation: BasicOperation<T>) -> HTTPHeaders {
        return HTTPHeaders(operation.headers)
    }
    
    private func handleError<T>(_ error: AFError, onOperation operation: BasicOperation<T>, response: Any?) {
        print("Operation Error: \(operation.endpoint) Error \(error.asAFError?.responseCode ?? 0): \(error.asAFError?.errorDescription ?? error.localizedDescription)")
    }
    
    private func addAuthorization(parameters: Parameters) -> Parameters {
        let ts = TimeInterval(NSDate().timeIntervalSince1970)
        let hash = "\(ts)\(appConfiguration.privateKeyMarvel)\(appConfiguration.publicKeyMarvel)".hashMD5()
        
        var parameters = parameters
        parameters["ts"] = "\(ts)"
        parameters["apikey"] = appConfiguration.publicKeyMarvel
        parameters["hash"] = hash
        
        return parameters
    }
    
    private func setupServerHost(serverHost: ServerHost, parameters: Parameters) -> (url: String, params: Parameters) {
        var parameters = parameters
        var url = ""
        
        switch serverHost {
        case .marvel:
            url = "\(appConfiguration.serverHostMarvel)/\(appConfiguration.serverApiVersionMarvel)"
            parameters = addAuthorization(parameters: parameters)
        case .unowned:
            debugPrint("Server host undefined")
        }
        
        return (url, parameters)
    }
}
