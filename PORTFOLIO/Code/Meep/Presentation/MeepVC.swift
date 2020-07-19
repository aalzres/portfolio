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
    lazy var main = UIView()
    var mapView: GMSMapView!
    // MARK: - Resource DetailView
    lazy var resourceDetailView: ResourceDetailView = {
        let resourceDetail = ResourceDetailView()
        resourceDetail.delegate = self
        resourceDetail.layer.cornerRadius = Constants.resourceDetailViewCornerRadius
        resourceDetail.backgroundColor = PColor.white
        resourceDetail.layer.shadowColor = PColor.black.cgColor
        resourceDetail.layer.shadowRadius = Constants.resourceDetailViewShadowRadius
        resourceDetail.layer.shadowOpacity = Constants.resourceDetailViewShadowOpacity
        resourceDetail.layer.shadowOffset = .zero
        return resourceDetail
    }()
    var resourceDetailHidden: NSLayoutConstraint!
    var resourceDetailSmall: NSLayoutConstraint!
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
        
        getResources(coordinatesOrigin: Coordinates(lat: Constants.locLisboaCameraLat, lon: Constants.locLisboaCameraLon))
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
        setupResourceDetail()
    }
    
    private func setupMap() {
        let camera = GMSCameraPosition.camera(withLatitude: Constants.locLisboaCameraLat,
                                              longitude: Constants.locLisboaCameraLon,
                                              zoom: Constants.zoomStreets)
        mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        mapView.delegate = self
        mapView.settings.indoorPicker = false
        mapView.setMinZoom(Constants.zoomCity, maxZoom: Constants.zoomBuildings)
        
        mapView.anchor(main,
                       top: view.topAnchor,
                       bottom: view.bottomAnchor,
                       leading: view.leadingAnchor,
                       trailing: view.trailingAnchor)
    }
    
    private func setupMarks() {
        mapView.clear()
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
    
    private func setupResourceDetail() {
        resourceDetailView.anchor(main,
                                  bottom: main.bottomAnchor, paddingBottom: ConstantsResourceDetail.heightResourceDetail,
                                  leading: main.leadingAnchor,
                                  trailing: main.trailingAnchor)
        resourceDetailHidden = resourceDetailView.heightAnchor.constraint(equalToConstant: ConstantsResourceDetail.sizeViewHidden)
        resourceDetailSmall = resourceDetailView.heightAnchor.constraint(equalToConstant: ConstantsResourceDetail.sizeViewSmall)
        resourceDetailHidden.isActive = true
    }
}
// MARK: - Funcion
extension MeepVC {
    private func getResources(coordinatesOrigin coords: Coordinates) {
        resourceParams = ResourceParamsEntity()
        resourceParams?.createFrame(coordinatesOrigin: coords, multiplier: Constants.baseMultiplier)
        presenter.getResources(resourceParams: resourceParams)
    }
    
    private func openResource(_ resource: ResourceEntity) {
        mapView.animate(toZoom: Constants.zoomBuildings)
        switchSizeResourceDetail(size: .small)
        resourceDetailView.updateResourceInfo(resource: resource)
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
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        switchSizeResourceDetail(size: .hidden)
    }
    
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        getResources(coordinatesOrigin: Coordinates(lat: position.target.latitude, lon: position.target.longitude))
    }
}
// MARK: - ResourceDetailViewDelegate
extension MeepVC: ResourceDetailViewDelegate {
    func minimizeView() {
        switchSizeResourceDetail(size: .hidden)
    }
}
// MARK: - Constants
private struct Constants {
    static let baseMultiplier: Double = 1.5
    static let locLisboaCameraLat: Double = 38.7261536
    static let locLisboaCameraLon: Double = -9.1477123
    
    static let zoomWorld: Float = 1
    static let zoomContinent: Float = 5
    static let zoomCity: Float = 10
    static let zoomStreets: Float = 15
    static let zoomBuildings: Float = 20
    
    static let resourceDetailViewCornerRadius: CGFloat = 16
    static let resourceDetailViewShadowRadius: CGFloat = 16
    static let resourceDetailViewShadowOpacity: Float = 0.2
}
