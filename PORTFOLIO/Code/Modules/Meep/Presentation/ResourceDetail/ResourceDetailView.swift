//
//  ResourceDetailView.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 18/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import UIKit
import Domain

protocol ResourceDetailViewDelegate: AnyObject {
    func minimizeView()
}

class ResourceDetailView: UIView {
    weak var delegate: ResourceDetailViewDelegate?
    var currentResource: ResourceEntity?
    
    lazy var main = UIView()
    lazy var arrow: UIButton = {
        let arrow = UIButton()
        arrow.setImage(UIImage(named: "arrowDown"), for: .normal)
        arrow.addTarget(self, action: #selector(minimizeView), for: .touchUpInside)
        return arrow
    }()
    lazy var id: UILabel = {
        let id = UILabel()
        id.font = .subtitle
        id.textColor = .black
        id.lineBreakMode = .byWordWrapping
        id.numberOfLines = 0
        return id
    }()
    lazy var companyZoneId: UILabel = {
        let companyZoneId = UILabel()
        companyZoneId.font = .secondary
        companyZoneId.textColor = .black
        companyZoneId.textAlignment = .right
        return companyZoneId
    }()
    lazy var lat: UILabel = {
        let lat = UILabel()
        lat.font = .primary
        lat.textColor = .black
        lat.text = "not_available".localized()
        return lat
    }()
    lazy var lon: UILabel = {
        let lon = UILabel()
        lon.font = .primary
        lon.textColor = .black
        lon.text = "not_available".localized()
        return lon
    }()
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupResourceView()
    }
    
    private func setupResourceView() {
        main.backgroundColor = .white
        
        main.anchor(self,
                    top: self.topAnchor,
                    bottom: self.bottomAnchor,
                    leading: self.leadingAnchor, paddingLeading: .paddingM,
                    trailing: self.trailingAnchor, paddingTrailing: -.paddingM)
        
        arrow.anchor(main,
                        top: main.topAnchor, paddingTop: .paddingXS,
                        leading: main.leadingAnchor,
                        trailing: main.trailingAnchor)
        
        id.anchor(main,
                  top: arrow.bottomAnchor, paddingTop: .paddingS,
                  leading: main.leadingAnchor)
        
        companyZoneId.anchor(main,
                             top: arrow.bottomAnchor, paddingTop: .paddingS,
                             leading: id.trailingAnchor, paddingLeading: .paddingS,
                             trailing: main.trailingAnchor)
        
        lat.anchor(main,
                   top: id.bottomAnchor, paddingTop: .paddingS,
                   leading: main.leadingAnchor)
        
        lon.anchor(main,
                   top: id.bottomAnchor, paddingTop: .paddingS,
                   leading: lat.trailingAnchor, paddingLeading: .paddingS,
                   trailing: main.trailingAnchor)
    }
    
    func updateResourceInfo(resource: ResourceEntity) {
        id.text = resource.name
        companyZoneId.text = "\(resource.companyZoneId)"
        
        guard let latitude = resource.latitude, let longitude = resource.longitude else { return }
        lat.text = "resource_detail_latitude".localizedWith(args: "\(latitude)")
        lon.text = "resource_detail_longitude".localizedWith(args: "\(longitude)")
    }
}
// MARK: - Delegate
extension ResourceDetailView {
    @objc
    func minimizeView() {
        delegate?.minimizeView()
    }
}
