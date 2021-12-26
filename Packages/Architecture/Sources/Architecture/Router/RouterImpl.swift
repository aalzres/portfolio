//
//  RouterImpl.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 25/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

import UIKit

public class RouterImpl: Router {
    let window: UIWindow?
    private var backMarks: [AnyObject.Type] = []
    private var navController: UINavigationController? { return window?.rootViewController as? UINavigationController }
    private var currentViewController: UIViewController? { return navController?.topViewController }

    public init(window: UIWindow?) {
        self.window = window
        self.window?.backgroundColor = .background
        window?.rootViewController = UINavigationController()
    }

    public func set(vc: UIViewController) {
        configNavBar(vc: vc)
        navController?.setViewControllers([vc], animated: true)
        backMarks.removeAll()
    }

    public func present(vc: UIViewController) {
        navController?.present(vc, animated: true, completion: nil)
    }

    public func push(vc: UIViewController) {
        push(vc: vc, markCurrent: false)
    }

    public func push(vc: UIViewController, markCurrent popMark: Bool) {
        configNavBar(vc: vc)
        if popMark { addPopMarkOnCurrentVC() }
        navController?.pushViewController(vc, animated: true)
    }

    @objc
    public func pop() {
        let oldVC = navController?.popViewController(animated: true)
        removeIfNeedOldMark(oldVC)
    }

    func popTo(vc: UIViewController) {
        let poppedVCs = navController?.popToViewController(vc, animated: true)

        poppedVCs?.forEach { removeIfNeedOldMark($0) }
    }

    public func popToRoot() {
        navController?.popToRootViewController(animated: true)
        backMarks.removeAll()
    }

    func addPopMarkOnCurrentVC() {
        guard let vc = currentViewController else { return }

        addPopMark(onVC: vc)
    }

    public func addPopMark(onVC vc: UIViewController) {
        let newMark: AnyObject.Type = type(of: vc)
        removeIfNeedOldMark(newMark)
        backMarks.append(newMark)
    }

    public func popToLastMark() {
        guard let mark = backMarks.last else {
            pop()
            return
        }

        let vc = navController?.viewControllers.last(where: {
            let popMark: AnyObject.Type = type(of: $0)
            return mark == popMark
        })

        guard let vcToPop = vc else {
            pop()
            return
        }

        backMarks.removeLast()
        popTo(vc: vcToPop)
    }

    private func configNavBar(vc: UIViewController) {
        vc.navigationItem.backBarButtonItem = UIBarButtonItem(title: vc.title ?? "", style: .plain, target: self, action: #selector(pop))

        let textAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: UIColor.dark]
        let backButton = UIImage(named: "router_icon_back")

        navController?.navigationBar.backIndicatorImage = backButton
        navController?.navigationBar.backIndicatorTransitionMaskImage = backButton
        navController?.navigationBar.barTintColor = .dark
        navController?.navigationBar.tintColor = .dark
        navController?.navigationBar.titleTextAttributes = textAttributes
        navController?.navigationBar.largeTitleTextAttributes = textAttributes
    }
}

private extension RouterImpl {
    func removeIfNeedOldMark(_ newVC: UIViewController?) {
        guard let vc = newVC else { return }

        let newMark: AnyObject.Type = type(of: vc)
        removeIfNeedOldMark(newMark)
    }

    func removeIfNeedOldMark(_ newMark:AnyObject.Type) {
        let index = backMarks.firstIndex { mark in mark == newMark }

        if let index = index { backMarks.remove(at: index) }
    }
}
