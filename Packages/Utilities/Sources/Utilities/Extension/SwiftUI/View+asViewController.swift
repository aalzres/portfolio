//
//  View+asViewController.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 29/10/22.
//

import SwiftUI

extension View {
    public var asViewController: UIViewController { UIHostingController(rootView: self) }
}
