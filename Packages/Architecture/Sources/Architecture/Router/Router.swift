//
//  Router.swift 
//  Architecture
//
//  Created by Andres Felipe Alzate Restrepo on 5/12/21.
//

import UIKit

public protocol Router {
    func set(vc: UIViewController)
    func present(vc: UIViewController)
    func push(vc: UIViewController)
    func push(vc: UIViewController, markCurrent: Bool)
    func pop()
    func popToRoot()
    func addPopMark(onVC: UIViewController)
    func popToLastMark()
}
