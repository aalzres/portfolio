//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//

import UIKit

extension UITableView {
    public var register: UITableViewCell.Type? {
        @available(*, unavailable, message: "Cannot read this property: 'register' is a set-only property")
        get { nil }
        set {
            guard let newValue = newValue else { return }
            register(newValue, forCellReuseIdentifier: newValue.reuseIdentifier)
        }
    }
}
