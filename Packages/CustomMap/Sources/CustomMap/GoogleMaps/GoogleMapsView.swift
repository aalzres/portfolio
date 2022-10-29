//
//  GoogleMapsView.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 29/10/22.
//

import SwiftUI
import GoogleMaps

struct GoogleMapsView: UIViewRepresentable {
     func makeUIView(context: Context) -> GMSMapView {
         let camera = GMSCameraPosition.london
         let mapView = GMSMapView(frame: .zero, camera: camera)

         return mapView
     }

     func updateUIView(_ uiView: GMSMapView, context: Context) { }
 }

extension GMSCameraPosition  {
     static var london = GMSCameraPosition.camera(withLatitude: 51.507, longitude: 0, zoom: 10)
 }

struct GoogleMapsViewPreview: PreviewProvider {
    static var previews: some View {
        GoogleMapsView()
    }
}
