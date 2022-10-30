//
//  CustomMapView.swift
//  CGoogleMaps
//
//  Created by Andres Felipe Alzate on 21/10/2022.
//  Copyright © 2022 aalzres. All rights reserved.
//

import SwiftUI
import Combine

struct CustomMapView: View {
    @ObservedObject var store: CustomMapStore

    var body: some View {
        ZStack {
            GoogleMapsView(updateCamera: $store.state.userLocation)
                .edgesIgnoringSafeArea(.all)
        }.onAppear(perform: { store.dispatch(action: .getUserLocation) })
    }
}

struct CustomMapViewViewPreview: PreviewProvider {
    static var store: CustomMapStore?
    static var previews: some View {
        CustomMapView(store: store!)
    }
}
