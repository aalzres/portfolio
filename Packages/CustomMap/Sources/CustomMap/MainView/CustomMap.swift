//
//  CustomMapView.swift
//  CGoogleMaps
//
//  Created by Andres Felipe Alzate on 21/10/2022.
//  Copyright © 2022 aalzres. All rights reserved.
//

import SwiftUI
import Utilities

public struct CustomMapView: View {
    public init() {
    }
    
    public var body: some View {
        ZStack {
            GoogleMapsView().edgesIgnoringSafeArea(.all)
        }
    }
}
struct CustomMapViewViewPreview: PreviewProvider {
    static var previews: some View {
        CustomMapView()
    }
}
