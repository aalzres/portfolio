//
//  MeepVC+ResourceDetail.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 18/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import UIKit
import UserInterface

// MARK: - MeepVC Details components
enum SizeResourceDetail {
    case hidden, small
    
    var size: CGFloat {
        switch self {
        case .hidden:   return ConstantsResourceDetail.sizeViewHidden
        case .small:    return ConstantsResourceDetail.sizeViewSmall
        }
    }
}
extension MeepVC {
    func switchSizeResourceDetail(size: SizeResourceDetail) {
        UIView.animate(withDuration: .animationDuration) { [weak self] in
            self?.resourceDetailHidden.isActive = false
            self?.resourceDetailSmall.isActive = false
            
            switch size {
            case .hidden:   self?.resourceDetailHidden.isActive = true
            case .small:    self?.resourceDetailSmall.isActive = true
            }
            
            self?.main.layoutIfNeeded()
            self?.main.setNeedsUpdateConstraints()
        }
    }
}
// MARK: - Constants
struct ConstantsResourceDetail {
    static let sizeViewHidden: CGFloat = heightResourceDetail
    static let sizeViewSmall: CGFloat = heightResourceDetail + 200
    static let heightResourceDetail: CGFloat = 200
}
