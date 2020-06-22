//
//  MainRouter.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate on 15/06/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import UIKit

enum TypeDialog {
    case goSetting
    case error
}

protocol MainRouter {
    func set(vc: UIViewController)
    func present(vc: UIViewController)
    func push(vc: UIViewController)
    func push(vc: UIViewController, markCurrent: Bool)
    func pop()
    func popTo(vc: UIViewController)
    func popToRoot()
    func addPopMark(onVC: UIViewController)
    func popToLastMark()
    func showDialog(_ message: String, type: TypeDialog, completionHandler completion: ((Bool) -> Void)?)
}

class MainRouterImpl: MainRouter {
    let window: UIWindow?
    private var backMarks: [AnyObject.Type] = []
    private var navController: UINavigationController? { return window?.rootViewController as? UINavigationController }
    private var currentViewController: UIViewController? { return navController?.topViewController }
    
    init(window: UIWindow?) {
        self.window = window
        window?.rootViewController = UINavigationController()
    }
    
    func set(vc: UIViewController) {
        configNavBar(vc: vc)
        navController?.setViewControllers([vc], animated: true)
        backMarks.removeAll()
    }
    
    func present(vc: UIViewController) {
        navController?.present(vc, animated: true, completion: nil)
    }
    
    func push(vc: UIViewController) {
        push(vc: vc, markCurrent: false)
    }
    
    func push(vc: UIViewController, markCurrent popMark: Bool) {
        configNavBar(vc: vc)
        if popMark { addPopMarkOnCurrentVC() }
        navController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func pop() {
        let oldVC = navController?.popViewController(animated: true)
        removeIfNeedOldMark(oldVC)
    }
    
    func popTo(vc: UIViewController) {
        let poppedVCs = navController?.popToViewController(vc, animated: true)
        
        poppedVCs?.forEach { removeIfNeedOldMark($0) }
    }
    
    func popToRoot() {
        navController?.popToRootViewController(animated: true)
        backMarks.removeAll()
    }
    
    func addPopMarkOnCurrentVC() {
        guard let vc = currentViewController else { return }
        
        addPopMark(onVC: vc)
    }
    
    func addPopMark(onVC vc: UIViewController) {
        let newMark: AnyObject.Type = type(of: vc)
        removeIfNeedOldMark(newMark)
        backMarks.append(newMark)
    }
    
    func popToLastMark() {
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
    
    func showDialog(_ message: String, type: TypeDialog, completionHandler completion: ((Bool) -> Void)? = nil) {
        switch type {
        case .goSetting:
            // TODO Alert for show message before go to setting
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: completion)
        default:
            break // TODO Alert basic
        }
    }
    
    private func configNavBar(vc: UIViewController) {
        vc.navigationItem.backBarButtonItem = UIBarButtonItem(title: vc.title ?? "", style: .plain, target: self, action: #selector(pop))
        
        let backButton = UIImage(named: "iconBack")
        navController?.navigationBar.backIndicatorImage = backButton
        navController?.navigationBar.backIndicatorTransitionMaskImage = backButton
    }
}

private extension MainRouterImpl {
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
