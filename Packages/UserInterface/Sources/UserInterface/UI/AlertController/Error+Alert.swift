//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//

import UIKit

public extension Error {
    func alert(_ completion: ((UIAlertAction) -> Void)?) -> AlertRepresentable {
        .init(
            message: localizedDescription,
            actions: [
                .init(title: "alert_view_action_cancel_by_default", style: .cancel),
                .init(title: "alert_view_action_try_again_by_default", action: completion)
            ]
        )
    }
    func alert() -> AlertRepresentable {
        .init(
            message: localizedDescription
        )
    }
}
