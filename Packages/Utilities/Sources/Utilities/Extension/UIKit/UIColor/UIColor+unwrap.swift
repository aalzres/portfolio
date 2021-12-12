//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//

import UIKit

extension Optional where Wrapped == UIColor {
    public func unwrap(_ defaultValue: UIColor = .white) -> UIColor { self ?? defaultValue }
}
