//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//

import UIKit

public struct AlertActionRepresentable {
    var title: String
    var style: UIAlertAction.Style
    var action: ((UIAlertAction) -> Void)?

    public init(
        title: String,
        style: UIAlertAction.Style = .default,
        action: ((UIAlertAction) -> Void)? = nil
    ) {
        self.title = title
        self.style = style
        self.action = action
    }
}
