//
//  BaseApiService.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 30/10/22.
//

import Combine
import Foundation

open class BaseApiService {
    private let urlComponents: URLComponents?
    private var urlSession: URLSession { URLSession.shared }

    public init(
        baseURL: String,
        version: String,
        service: String
    ) {
        self.urlComponents = URLComponents(string: "\(baseURL)/\(version)/\(service)/")
    }

    public func getDataTaskPublisher<T: Decodable>(
        params: AsQueryItems
    ) -> AnyPublisher<T, Error> {
        guard var urlComponents = urlComponents else {
            assertionFailure("Fail to read urlComponents")
            return Fail(error: NSError.errorToReadURLComponents).eraseToAnyPublisher()
        }
        urlComponents.queryItems = params.asQueryItems

        guard let url = urlComponents.url else {
            assertionFailure("Fail to read urlComponents.url")
            return Fail(error: NSError.errorToReadURL).eraseToAnyPublisher()
        }

        return urlSession.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
