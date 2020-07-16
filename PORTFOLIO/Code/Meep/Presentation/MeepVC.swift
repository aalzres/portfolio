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
        let camera = GMSCameraPosition.camera(withLatitude: Constans.locationLisboaLat,
                                              longitude: Constans.locationLisboaLong,
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
// MARK: - MeepPresenterOutput
extension MeepVC: MeepPresenterOutput {}
// MARK: - Constants
private struct Constans {
    static let locationLisboaLat: Double = 38.7437396
    static let locationLisboaLong: Double = -9.2302434
    static let locationZoom: Float = 10
    static let maxZoom: Float = 20
}
