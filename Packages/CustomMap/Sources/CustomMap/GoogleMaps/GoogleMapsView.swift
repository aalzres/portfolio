//
//  GoogleMapsView.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 29/10/22.
//

import SwiftUI
import GoogleMaps

struct GoogleMapsView: UIViewRepresentable {
    @Binding var updateCamera: CustomMapCoordinates?

    func makeUIView(context: Context) -> GMSMapView {
        GMSMapView(frame: .zero)
    }

    func updateUIView(_ uiView: GMSMapView, context: Context) {
        guard let updateCamera else { return }
        let coordinates = CLLocationCoordinate2D(
            latitude: updateCamera.latitude,
            longitude: updateCamera.longitude
        )
        let newPosition = GMSCameraUpdate.setTarget(coordinates)
        uiView.animate(with: newPosition)
    }
 }

struct GoogleMapsViewPreview: PreviewProvider {
    static let updateCamera = CustomMapCoordinates(latitude: 0, longitude: 0)

    static var previews: some View {
        GoogleMapsView(updateCamera: .constant(updateCamera))
    }
}
