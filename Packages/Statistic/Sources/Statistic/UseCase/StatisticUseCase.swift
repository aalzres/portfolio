//
//  StatisticUseCase.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 10/8/22.
//  Copyright © 2022 aalzres. All rights reserved.
//

import RxSwift

protocol StatisticUseCase {
    func getMean(values: Double...) -> Single<Result<Double, StatisticError>>
    func getMean(values: [Double]) -> Single<Result<Double, StatisticError>>
}

public class StatisticUseCaseImpl: StatisticUseCase {
    public init() {}

    public func getMean(values: Double...) -> Single<Result<Double, StatisticError>> {
        getMean(values: values)
    }
    public func getMean(values: [Double]) -> Single<Result<Double, StatisticError>> {
        .just(.success(0))
    }
}
