//
//  AppConfiguration.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 10/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

public struct AppConfiguration {
    public let serverHostMarvel: String = Bundle.portfolioConfigurationValue("ServerHostMarvel")!
    public let publicKeyMarvel: String = Bundle.portfolioConfigurationValue("PublicKeyMarvel")!
    public let privateKeyMarvel: String = Bundle.portfolioConfigurationValue("PrivateKeyMarvel")!
    public let serverApiVersionMarvel: String = Bundle.portfolioConfigurationValue("ServerApiVersionMarvel")!
    public let gMapsApiKey: String = Bundle.portfolioConfigurationValue("GMapsApiKey")!
    public let serverHostMeep: String = Bundle.portfolioConfigurationValue("ServerHostMeep")!
    public let serverApiVersionMeep: String = Bundle.portfolioConfigurationValue("ServerApiVersionMeep")!
    public init() {}
}

fileprivate extension Bundle {
    class func portfolioConfigurationValue<T>(_ key: String) -> T? {
        let shepDictionary = main
            .object(forInfoDictionaryKey: "PORTFOLIOConfiguration") as! Dictionary<String, Any>
        return shepDictionary[key] as? T
    }
}
