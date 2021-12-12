//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/12/21.
//

import Foundation
import RxSwift
import ObjectiveC

fileprivate var disposeBagContext: UInt8 = 0

public protocol HasDisposeBag: AnyObject {
    var disposeBag: DisposeBag { get set }
}

extension HasDisposeBag {
    func synchronizedBag<T>( _ action: () -> T) -> T {
        objc_sync_enter(self)
        let result = action()
        objc_sync_exit(self)
        return result
    }

    public var disposeBag: DisposeBag {
        get {
            return synchronizedBag {
                if let disposeObject = objc_getAssociatedObject(self, &disposeBagContext) as? DisposeBag {
                    return disposeObject
                }
                let disposeObject = DisposeBag()
                objc_setAssociatedObject(self, &disposeBagContext, disposeObject, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                return disposeObject
            }
        }

        set {
            synchronizedBag {
                objc_setAssociatedObject(self, &disposeBagContext, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
}
