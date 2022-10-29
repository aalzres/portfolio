//
//  BaseDeinit.swift
//  Architecture
//
//  Created by Andres Felipe Alzate Restrepo on 5/12/21.
//

open class BaseDeinit {
    public static let shared = BaseDeinit()
    
    private init() {}

    public func printDeinit(_ object: AnyObject) {
        debugPrint("deinit", String(describing: type(of: object)))
    }
}
