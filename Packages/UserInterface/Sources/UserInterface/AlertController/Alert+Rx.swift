//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//

import RxSwift
import RxCocoa

import UIKit

public extension Reactive where Base: UIView {
    var presentAlert: Binder<AlertRepresentable?> {
        Binder(base) { view, representable  in
            guard let representable = representable else { return }
            let alert = AlertController(representable)
            view.parentViewController?.present(alert.alertViewController, animated: true, completion: nil)
        }
    }
}
