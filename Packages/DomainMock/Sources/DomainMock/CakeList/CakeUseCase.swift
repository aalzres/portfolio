//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//

import Domain
import RxSwift
import Foundation

public class CakeListUseCaseMock: CakeListUseCase {
    //MARK: - getCakeListItem
    var getCakeListItemCallsCount = 0
    var getCakeListItemCalled: Bool {
        return getCakeListItemCallsCount > 0
    }
    var getCakeListItemReturnValue: Single<Result<[CakeItem], Error>>!
    var getCakeListItemClosure: (() -> Single<Result<[CakeItem], Error>>)?
    public func getCakeListItem() -> Single<Result<[CakeItem], Error>> {
        getCakeListItemCallsCount += 1
        return getCakeListItemClosure.map({ $0() }) ?? getCakeListItemReturnValue
    }
}

extension CakeListUseCaseMock {
    public enum Mock {
        case success
        case failure
        case isEmpty
    }

    public convenience init(_ mock: Mock) {
        self.init()

        switch mock {
        case .success:
            getCakeListItemClosure = {
                Observable.create { observer in
                    let seconds = 1.0
                    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                        observer.onNext(.success([CakeItemMock.caseA, CakeItemMock.caseB]))
                        observer.onCompleted()
                    }
                    return Disposables.create()
                }
                .asSingle()
            }

        case .failure:
            getCakeListItemClosure = {
                Observable.create { observer in
                    let seconds = 1.0
                    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                        observer.onNext(.failure(RxError.noElements))
                        observer.onCompleted()
                    }
                    return Disposables.create()
                }
                .asSingle()
            }

        case .isEmpty:
            getCakeListItemClosure = {
                Observable.create { observer in
                    let seconds = 1.0
                    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                        observer.onNext(.success([]))
                        observer.onCompleted()
                    }
                    return Disposables.create()
                }
                .asSingle()
            }
        }
    }
}

