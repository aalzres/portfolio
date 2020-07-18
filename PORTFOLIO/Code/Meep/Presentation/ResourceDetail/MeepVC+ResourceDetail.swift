//
//  MeepVC+ResourceDetail.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 18/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation
import UIKit

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
        UIView.animate(withDuration: PDimen.animationDuration) { [weak self] in
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
    static let sizeViewHidden: CGFloat = 0
    static let sizeViewSmall: CGFloat = 200
}
