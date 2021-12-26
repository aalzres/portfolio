//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 26/12/21.
//

import RxSwift
import RxCocoa

extension Reactive where Base == CButton {
    public var tap: ControlEvent<Void> {
        base.customButtom.rx.tap
    }
}
