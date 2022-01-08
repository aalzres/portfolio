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
    var tabBar: MainTabBar?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        createWindow()
        installInitialTabBar()
        return true
    }
}

private extension AppDelegate {
    func createWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
    }

    func installInitialTabBar() {
        tabBar = MainTabBar(tabBarController: UITabBarController()).execute()
        window?.rootViewController = tabBar?.tabBarController
    }
}
extension UIApplication {
    static var serviceLocator: ServiceLocator = ServiceLocator()
}
