//
//  StatisticUseCase.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 10/8/22.
//  Copyright © 2022 aalzres. All rights reserved.
//

import RxSwift

public protocol StatisticUseCase {
    func getMean(values: Double...) -> Single<Result<Double, StatisticError>>
    func getMean(values: [Double]) -> Single<Result<Double, StatisticError>>
    func getMedian(values: Double...) -> Single<Result<Double, StatisticError>>
    func getMedian(values: [Double]) -> Single<Result<Double, StatisticError>>
}

public class StatisticUseCaseImpl: StatisticUseCase {
    public init() {}

    public func getMean(values: Double...) -> Single<Result<Double, StatisticError>> {
        getMean(values: values)
    }
    public func getMean(values: [Double]) -> Single<Result<Double, StatisticError>> {
        if values.contains([0, 0]) { return .just(.failure(.divisionByZero)) }
        if values.isEmpty { return .just(.failure(.isEmpty)) }
        return .just(.success(values.reduce(0, +) / values.count.double))
    }
    public func getMedian(values: Double...) -> Single<Result<Double, StatisticError>> {
        getMedian(values: values)
    }
    public func getMedian(values: [Double]) -> Single<Result<Double, StatisticError>> {
        if values.contains([0, 0]) { return .just(.failure(.divisionByZero)) }
        if values.isEmpty { return .just(.failure(.isEmpty)) }
        var expectedValue: Double {
            let values = values.sorted()
            let isPair = values.count % 2 == 0 ? 1 : 0
            let numbersToRemove = (values.count / 2) - isPair
            return values
                .dropFirst(numbersToRemove)
                .dropLast(numbersToRemove)
                .average()
        }

        return .just(.success(expectedValue))
    }
}
