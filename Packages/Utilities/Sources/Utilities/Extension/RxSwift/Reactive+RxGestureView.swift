//
//  Reactive+RxGestureView.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/8/22.
//

import RxSwift
import RxGesture

extension Reactive where Base: RxGestureView {
    public var tapWhenEnded: Observable<Void> {
        tapGesture().when(.ended).mapToVoid().asObservable()
    }
}
