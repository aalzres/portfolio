//
//  BaseKeyboardViewController+Rx.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/8/22.
//

import UIKit

import RxSwift

extension Reactive where Base: BaseKeyboardViewController {
    var keyboardWillShow: Binder<Notification> {
        Binder(base) { base, notification in
            guard let keyboardSize =
                    (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?
                    .cgRectValue
            else { return }

            let bottom = keyboardSize.height - base.contentSticky
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: bottom, right: 0.0)
            base.scrollView.contentInset = contentInsets
            base.scrollView.scrollIndicatorInsets = contentInsets
        }
    }
    var keyboardWillHide: Binder<Notification> {
        Binder(base) { base, _ in
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
            base.scrollView.contentInset = contentInsets
            base.scrollView.scrollIndicatorInsets = contentInsets
        }
    }
    var dismissKeyboard: Binder<UITapGestureRecognizer> {
        Binder(base) { base, _ in
            base.view.endEditing(true)
        }
    }
}
