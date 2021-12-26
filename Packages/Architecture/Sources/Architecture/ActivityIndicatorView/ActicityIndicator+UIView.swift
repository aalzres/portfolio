//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/12/21.
//

import SnapKit
import UIKit
import RxSwift
import RxCocoa

public extension Reactive where Base: UIView {
    var loadingStatus: Binder<Bool> {
        Binder(base) { base, value in
            value ? base.showActicityIndicator : base.hideActivityIndicator
        }
    }
}

private extension UIView {
    var showActicityIndicator: Void {
        let activityIndicator = ActivityIndicatorView()
        addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        activityIndicator.start
    }

    var hideActivityIndicator: Void {
        subviews.forEach {
            if $0.isKind(of: ActivityIndicatorView.self) {
                $0.removeFromSuperview()
            }
        }
    }
}
