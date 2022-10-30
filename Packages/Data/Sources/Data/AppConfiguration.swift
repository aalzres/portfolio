//
//  AppConfiguration.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 10/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

public struct AppConfiguration {
    /// KEY
    public let gMapsApiKey: String = Bundle.portfolioConfigurationValue("GMapsApiKey")!
    public let privateKeyMarvel: String = Bundle.portfolioConfigurationValue("PrivateKeyMarvel")!
    public let publicKeyMarvel: String = Bundle.portfolioConfigurationValue("PublicKeyMarvel")!

    /// SERVER_API_VERSION
    public let serverApiVersionCustomMap: String = Bundle.portfolioConfigurationValue("ServerApiVersionCustomMap")!
    public let serverApiVersionMarvel: String = Bundle.portfolioConfigurationValue("ServerApiVersionMarvel")!

    /// SERVER_HOST
    public let serverHostCustomMap: String = Bundle.portfolioConfigurationValue("ServerHostCustomMap")!
    public let serverHostMarvel: String = Bundle.portfolioConfigurationValue("ServerHostMarvel")!

    public init() {}
}

fileprivate extension Bundle {
    class func portfolioConfigurationValue<T>(_ key: String) -> T? {
        let shepDictionary = main
            .object(forInfoDictionaryKey: "PORTFOLIOConfiguration") as! Dictionary<String, Any>
        return shepDictionary[key] as? T
    }
}
