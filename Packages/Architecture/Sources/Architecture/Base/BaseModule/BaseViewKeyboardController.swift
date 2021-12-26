//
//  UIKeyboardController.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 21/06/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import UIKit

open class BaseViewKeyboardController: BaseViewControllerImpl {
    open var contentHeightExtra: CGFloat { 0 }
    public lazy var scrollView = UIScrollView()
    public lazy var contentView = UIView()
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
    }

    open override func addAllSubviews() {
        super.addAllSubviews()
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
    }

    open override func addAllConstraints() {
        super.addAllConstraints()
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(safeArea)
        }
        contentView.snp.makeConstraints {
            $0.edges.width.equalToSuperview()
        }
    }
    @objc
    func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }

        let bottom = keyboardSize.height - contentHeightExtra
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: bottom, right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc
    func keyboardWillHide(notification: NSNotification) {
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
