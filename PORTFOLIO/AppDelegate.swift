//
//  AppDelegate.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate on 15/06/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import UIKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        configureGMaps()
        
        createWindow()
        installInitialViewController()
        
        return true
    }
}

private extension AppDelegate {
    func createWindow() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        self.window = window
    }
    
    func installInitialViewController() {
        let vc = SplashRouter.create()
        UIApplication.serviceLocator.mainRouter.set(vc: vc)
    }
    
    func configureGMaps() {
        GMSServices.provideAPIKey(UIApplication.serviceLocator.appConfiguration.gMapsApiKey)
    }
}

extension UIApplication {
    static var serviceLocator: ServiceLocator = ServiceLocator()
}
