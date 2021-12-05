//
//  MeepVC.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 16/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import UIKit
import MapKit
import Architecture

class MeepVC: UIViewController {
    // MARK: - Presenter
    private let presenter: MeepPresenter
    // MARK: - Params of request
    private lazy var resourceParams: ResourceParamsEntity? = nil
    // MARK: - MapView
    lazy var main = UIView()
    lazy var mapView = MKMapView()
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

    deinit {
        BaseDeinit.shared.printDeinit(self)
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
        mapView.anchor(main,
                       top: view.topAnchor,
                       bottom: view.bottomAnchor,
                       leading: view.leadingAnchor,
                       trailing: view.trailingAnchor)
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
        switchSizeResourceDetail(size: .small)
        resourceDetailView.updateResourceInfo(resource: resource)
    }
}
// MARK: - MeepPresenterOutput
extension MeepVC: MeepPresenterOutput {
    func getResourcesSuccess(resourcesList: [ResourceEntity]) {
        self.resourcesList = resourcesList
    }
    
    func getResourcesFailure(_ error: String) {
        debugPrint(error)
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
