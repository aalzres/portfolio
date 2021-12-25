//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 25/12/21.
//

import RxSwift

extension Reactive where Base: UIImageView {
    public var imageRepresentable: Binder<ImageRepresentable> {
        Binder(base) { base, imageRepresentable in
            base.imageRepresentable = imageRepresentable
        }
    }
}
