//
//  CakeListUseCase.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 10/12/21.
//

import RxSwift

public protocol CakeListUseCase {
    func getCakeListItem() -> Single<Result<[CakeItem], Error>>
}

public struct CakeListUseCaseImpl: CakeListUseCase {
    private let repository: CakeListRepository

    public init(repository: CakeListRepository) {
        self.repository = repository
    }

    public func getCakeListItem() -> Single<Result<[CakeItem], Error>> {
        repository.getCakeList()
    }
}
