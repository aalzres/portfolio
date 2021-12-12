//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//

import UIKit
import Utilities

public struct AlertRepresentable {
    public var title: String
    public var message: String
    public var preferredStyle: UIAlertController.Style
    public var actions: [AlertActionRepresentable]

    public init(
        title: String = "",
        message: String,
        preferredStyle: UIAlertController.Style = .alert,
        actions: [AlertActionRepresentable] = [
            .init(title: "alert_view_action_title_by_default".localized())
        ]
    ) {
        self.title = title
        self.message = message
        self.preferredStyle = preferredStyle
        self.actions = actions
    }
}
