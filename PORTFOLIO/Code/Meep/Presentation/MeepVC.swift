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
    private let presenter: MeepPresenter
    private lazy var resourceParams: ResourceParamsEntity? = nil
    
    private lazy var main = UIView()
    private var mapView: GMSMapView!
    
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
        let camera = GMSCameraPosition.camera(withLatitude: Constans.locationLisboaUpLat,
                                              longitude: Constans.locationLisboaUpLon,
                                              zoom: Constans.locationZoom)
        mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        mapView.setMinZoom(mapView.minZoom, maxZoom: Constans.maxZoom)
        
        mapView.anchor(main,
                       top: view.topAnchor,
                       bottom: view.bottomAnchor,
                       leading: view.leadingAnchor,
                       trailing: view.trailingAnchor)
    }
}
// MARK: - Funcion
extension MeepVC {
    private func getResources() {
        resourceParams = ResourceParamsEntity()
        resourceParams?.lowerLeft = Coordinates(lat: Constans.locationLisboaLowLat, lon: Constans.locationLisboaLowLon)
        resourceParams?.upperRight = Coordinates(lat: Constans.locationLisboaUpLat, lon: Constans.locationLisboaUpLon)
        presenter.getResources(resourceParams: resourceParams)
    }
}
// MARK: - MeepPresenterOutput
extension MeepVC: MeepPresenterOutput {
    func getResourcesSuccess(resourcesList: [ResourceEntity]) {
        print("-Test->\(resourcesList.count)")
    }
    
    func getResourcesFailure(_ error: String) {
        debugPrint(error)
    }
}
// MARK: - Constants
private struct Constans {
    static let locationLisboaLowLat: Double = 38.711046
    static let locationLisboaLowLon: Double = -9.160096
    static let locationLisboaUpLat: Double = 38.739429
    static let locationLisboaUpLon: Double = -9.137115
    
    static let locationZoom: Float = 10
    static let maxZoom: Float = 20
}
