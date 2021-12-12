//
//  CakeListRepository.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/12/21.
//

import RxSwift

public protocol CakeListRepository {
    func getCakeList() -> Single<Result<[CakeItem], Error>>
}
