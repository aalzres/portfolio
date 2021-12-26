//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 25/12/21.
//

import UIKit
import RxSwift

extension UIImageView {
    public var imageRepresentable: ImageRepresentable? {
        @available(*, unavailable, message: "Cannot read this property: imageRepresentable is a set-only property")
        get { nil }
        set {
            switch newValue {
            case let .external(urlString):
                guard let urlString = urlString else { return }
                guard let urlRequest: URLRequest = URLRequest(urlString: urlString) else { return }
                URLSession.shared.rx
                    .response(request: urlRequest)
                    .subscribe(on: ConcurrentMainScheduler.instance)
                    .map { UIImage(data: $0.data) }
                    .bind(to: rx.image)
                    .disposed(by: rx.disposeBag)

            case let .internal(uiImage):
                image = uiImage

            case .none:
                image = nil
            }
        }
    }
}
