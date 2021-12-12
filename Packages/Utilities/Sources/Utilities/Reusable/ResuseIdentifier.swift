//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//

public protocol Reusable {
    static var reuseIdentifier: String { get }
}

public extension Reusable {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}

import UIKit
extension UITableViewCell: Reusable { }
extension UICollectionViewCell: Reusable { }
