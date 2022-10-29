//
//  CustomMapView.swift
//  CGoogleMaps
//
//  Created by Andres Felipe Alzate on 21/10/2022.
//  Copyright © 2022 aalzres. All rights reserved.
//

import SwiftUI
import Combine

import Utilities

struct CustomMapView: View {
    @EnvironmentObject var store: CustomMapStore

    var body: some View {
        ZStack {
            GoogleMapsView().edgesIgnoringSafeArea(.all)
            Text(store.state.coordinates)
                .foregroundColor(.red)
                .fontWeight(.heavy)
                .font(.largeTitle)
                .onTapGesture { store.dispatch(action: .onMapMoved) }
        }
    }
}

struct CustomMapViewViewPreview: PreviewProvider {
    static var previews: some View {
        CustomMapView()
    }
}
