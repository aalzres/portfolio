//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//

import UIKit

extension UIImage {
    convenience public init?(cakeListNamed named: String) {
        self.init(
            named: named,
            in: Bundle.module,
            compatibleWith: nil
        )
    }
}
