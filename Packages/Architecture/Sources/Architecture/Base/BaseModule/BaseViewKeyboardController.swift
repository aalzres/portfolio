//
//  UIKeyboardController.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 21/06/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import UIKit

import RxGesture

open class BaseKeyboardViewController: BaseUIScrollViewController {
    open var contentSticky: CGFloat { 0 }

    open override func viewDidLoad() {
        super.viewDidLoad()
        bindKeyboard()
    }

    private func bindKeyboard() {
        view.rx.tapGesture()
            .when(.recognized)
            .do(onNext: { $0.cancelsTouchesInView = false })
            .bind(to: rx.dismissKeyboard)
            .disposed(by: rx.disposeBag)

        NotificationCenter.default.rx.notification(UIResponder.keyboardWillShowNotification)
            .bind(to: rx.keyboardWillShow)
            .disposed(by: rx.disposeBag)

        NotificationCenter.default.rx.notification(UIResponder.keyboardWillHideNotification)
            .bind(to: rx.keyboardWillHide)
            .disposed(by: rx.disposeBag)
    }
}
