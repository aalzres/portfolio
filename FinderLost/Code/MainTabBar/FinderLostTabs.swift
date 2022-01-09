//
//  FinderLostTabs.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 8/1/22.
//

import UIKit

enum TabView: Int, CaseIterable {
    case finder = 0, lost, more
}

extension TabView {
    var rootViewController: UIViewController? {
        let router = UIApplication.serviceLocator.mainRouter
        switch self {
        case .finder: return UIViewController()
        case .lost: return UIViewController()
        case .more:
            let coordinator = MoreCoordinatorImpl(router: router)
            coordinator.present()
            return coordinator.viewController
        }
    }
    var title: String {
        switch self {
        case .finder: return "Finder"
        case .lost: return "Lost"
        case .more: return "More"
        }
    }
    var image: UIImage? {
        switch self {
        case .finder: return UIImage(named: "Finder")
        case .lost: return UIImage(named: "Lost")
        case .more: return UIImage(named: "More")
        }
    }
}
