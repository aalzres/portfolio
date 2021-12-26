//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//

import UIKit

import Architecture

class AlertController {
    var alertViewController: UIAlertController
    private var alertView: UIView? {
        alertViewController.view.subviews.first?.subviews.first?.subviews.first
    }

    init(_ representable: AlertRepresentable) {
        self.alertViewController = .init(
            title: representable.title,
            message: representable.message,
            preferredStyle: representable.preferredStyle
        )
        alertViewController.addActions(representable.actions)
        setupView(representable)
    }

    private func setupView(_ representable: AlertRepresentable) {
        setupBackgroundColor()
        setupColorButtons()

        setupFont(
            string: alertViewController.title,
            color: .dark,
            style: .title,
            forKey: "attributedTitle"
        )

        setupFont(
            string: alertViewController.message,
            color: .text,
            style: .subtitle,
            forKey: "attributedMessage"
        )
    }

    private func setupBackgroundColor() {
        alertView?.set(\.backgroundColor, .white)
    }

    private func setupColorButtons() {
        alertViewController.actions.forEach { action in
            switch action.style {
            case .cancel, .destructive: action.setValue(UIColor.error, forKey: "titleTextColor")
            case .`default`: action.setValue(UIColor.first, forKey: "titleTextColor")
            @unknown default: assertionFailure("New case not implemented")
            }
        }
    }

    private func setupFont(string: String?, color: UIColor, style: UIFont, forKey: String) {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: style,
            .foregroundColor: color
        ]
        let attributedString = NSMutableAttributedString(string: string.unwrap(), attributes: attributes)
        alertViewController.setValue(attributedString, forKey: forKey)
    }
}
