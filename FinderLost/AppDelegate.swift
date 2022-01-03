//
//  AppDelegate.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 26/12/21.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
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
        let vc = UIViewController()
        UIApplication.serviceLocator.mainRouter.set(vc: vc)
    }
}
extension UIApplication {
    static var serviceLocator: ServiceLocator = ServiceLocator()
}
