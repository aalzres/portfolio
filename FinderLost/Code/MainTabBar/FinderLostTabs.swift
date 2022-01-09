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
    var image: UIImage? {
        switch self {
        case .finder: return UIImage(named: "")
        case .lost: return UIImage(named: "")
        case .more: return UIImage(named: "main_tab_bar_more")
        }
    }
}
