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
    }

    @discardableResult
    func execute() -> Self {
        setupAppearance()
        createViews()
        return self
    }

    private func setupAppearance() {
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white

            tabBarController.tabBar.standardAppearance = appearance
            tabBarController.tabBar.scrollEdgeAppearance = appearance
        }
    }

    private func createViews() {
        tabBarController.viewControllers = TabView.allCases.compactMap(\.viewController)
    }
}

extension TabView {
    var viewController: UIViewController? {
        guard let rootViewController = rootViewController else { return nil }
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.image = image
        navController.tabBarItem.title = rootViewController.title
        return navController
    }
}
