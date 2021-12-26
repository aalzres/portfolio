//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//

import UIKit

extension UIAlertController {
    @discardableResult
    func addAction(_ representable: AlertActionRepresentable?) -> Self {
        guard let representable = representable else { return self }
        let action = UIAlertAction(
            title: representable.title,
            style: representable.style,
            handler: representable.action
        )
        addAction(action)
        return self
    }

    @discardableResult
    func addActions(_ representables: AlertActionRepresentable?...) -> Self {
        representables.forEach { addAction($0) }
        return self
    }

    @discardableResult
    func addActions(_ representables: [AlertActionRepresentable]) -> Self {
        representables.forEach { addAction($0) }
        return self
    }
}
