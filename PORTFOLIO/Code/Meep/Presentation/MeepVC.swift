//
//  MeepVC.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 16/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import UIKit
import GoogleMaps

class MeepVC: UIViewController {
    // MARK: - Presenter
    private let presenter: MeepPresenter
    // MARK: - Params of request
    private lazy var resourceParams: ResourceParamsEntity? = nil
    // MARK: - MapView
    private lazy var main = UIView()
    private var mapView: GMSMapView!
    // MARK: - ResourceList
    private var resourcesList: [ResourceEntity]?
    init(presenter: MeepPresenter) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getResources()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    //MARK: - Setups
    private func setupView() {
        view.backgroundColor = .white
        
        main.anchor(view,
                    top: view.topAnchor,
                    bottom: view.bottomAnchor,
                    leading: view.leadingAnchor,
                    trailing: view.trailingAnchor)
        
        setupMap()
    }
    
    private func setupMap() {
        let camera = GMSCameraPosition.camera(withLatitude: Constants.locLisboaCameraLat,
                                              longitude: Constants.locLisboaCameraLon,
                                              zoom: Constants.locationZoom)
        mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        mapView.delegate = self
        mapView.setMinZoom(mapView.minZoom, maxZoom: Constants.maxZoom)
        
        mapView.anchor(main,
                       top: view.topAnchor,
                       bottom: view.bottomAnchor,
                       leading: view.leadingAnchor,
                       trailing: view.trailingAnchor)
    }
    
    private func setupMarks() {
        guard let resourcesList = resourcesList else { return }
        for resource in resourcesList {
            guard let lat = resource.latitude, let lon = resource.longitude  else { return }
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: lat, longitude: lon)
            marker.userData = resource
            marker.icon = GMSMarker.markerImage(with: resource.color)
            marker.map = mapView
        }
    }
}
// MARK: - Funcion
extension MeepVC {
    private func getResources() {
        resourceParams = ResourceParamsEntity()
        resourceParams?.lowerLeft = Coordinates(lat: Constants.locLisboaLowLat, lon: Constants.locLisboaLowLon)
        resourceParams?.upperRight = Coordinates(lat: Constants.locLisboaUpLat, lon: Constants.locLisboaUpLon)
        presenter.getResources(resourceParams: resourceParams)
    }
    
    private func openResource(_ resource: ResourceEntity) {
        mapView.animate(toZoom: Constants.maxZoom)
        // TODO
    }
}
// MARK: - MeepPresenterOutput
extension MeepVC: MeepPresenterOutput {
    func getResourcesSuccess(resourcesList: [ResourceEntity]) {
        self.resourcesList = resourcesList
        
        setupMarks()
    }
    
    func getResourcesFailure(_ error: String) {
        debugPrint(error)
    }
}
// MARK: - GMSMapViewDelegate
extension MeepVC: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        guard let resource = marker.userData as? ResourceEntity else { return false }
        
        openResource(resource)
        
        return false
    }
}
// MARK: - Constants
private struct Constants {
    static let locLisboaLowLat: Double = 38.711046
    static let locLisboaLowLon: Double = -9.160096
    static let locLisboaUpLat: Double = 38.739429
    static let locLisboaUpLon: Double = -9.137115
    static let locLisboaCameraLat: Double = 38.7261536
    static let locLisboaCameraLon: Double = -9.1477123
    
    static let locationZoom: Float = 14.5
    static let maxZoom: Float = 20
}
