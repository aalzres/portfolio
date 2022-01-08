//
//  MainTabBar.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 3/1/22.
//

import UIKit

final class MainTabBar {
    var tabBarController: UITabBarController

    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController

        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white

            tabBarController.tabBar.standardAppearance = appearance
            tabBarController.tabBar.scrollEdgeAppearance = appearance
        }
    }

    @discardableResult
    func execute() -> Self {
        createViews()
        return self
    }

    private func createViews() {
        tabBarController.viewControllers = TabView.allCases.map(\.viewController)
    }
}

extension TabView {
    var viewController: UIViewController {
        rootViewController.navigationItem.title = title
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem.image = image
        navController.tabBarItem.title = title
        return navController
    }
}
