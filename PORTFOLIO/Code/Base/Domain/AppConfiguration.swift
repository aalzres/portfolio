//
//  AppConfiguration.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 10/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

struct AppConfiguration {
    let serverHostMarvel: String = Bundle.portfolioConfigurationValue("ServerHostMarvel")!
    let publicKeyMarvel: String = Bundle.portfolioConfigurationValue("PublicKeyMarvel")!
    let privateKeyMarvel: String = Bundle.portfolioConfigurationValue("PrivateKeyMarvel")!
    let serverApiVersionMarvel: String = Bundle.portfolioConfigurationValue("ServerApiVersionMarvel")!
    let gMapsApiKey: String = Bundle.portfolioConfigurationValue("GMapsApiKey")!
    let serverHostMeep: String = Bundle.portfolioConfigurationValue("ServerHostMeep")!
    let serverApiVersionMeep: String = Bundle.portfolioConfigurationValue("ServerApiVersionMeep")!
}

fileprivate extension Bundle {
    class func portfolioConfigurationValue<T>(_ key: String) -> T? {
        let shepDictionary = main.object(forInfoDictionaryKey: "PORTFOLIOConfiguration") as! Dictionary<String, Any>
        
        return shepDictionary[key] as? T
    }
}
