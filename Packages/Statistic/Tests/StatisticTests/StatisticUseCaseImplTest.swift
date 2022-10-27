//
//  StatisticUseCaseImplTest.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 10/8/22.
//  Copyright © 2022 aalzres. All rights reserved.
//

import Quick
import Nimble

import RxBlocking

import SwifterSwift

import Statistic

class StatisticUseCaseImplTest: QuickSpec {
    override func spec() {
        var sut: StatisticUseCase!
        var randomValue: Double {
            Double.random(in: -9...9).rounded(numberOfDecimalPlaces: 2, rule: .down)
        }
        var numberOfElements: Int {
            Int.random(in: 2...5)
        }
        var setNumbers: [Double] {
            (1...numberOfElements).map { _ in randomValue }
        }

        describe("StatisticUseCaseImpl") {
            beforeEach {
                sut = StatisticUseCaseImpl()
            }

            context("Mean test") {
                it("Success") {
                    let setNumbers = setNumbers

                    let single = sut.getMean(values: setNumbers)
                    let value = try? single.toBlocking().single().success
                    let expectedValue = setNumbers.reduce(0, +) / setNumbers.count.double

                    expect(value).to(equal(expectedValue))
                }
                it("failure - Division by zero") {
                    let setNumbers: [Double] = [0]

                    let single = sut.getMean(values: setNumbers)
                    let value = try? single.toBlocking().single().failure
                    let expectedValue = StatisticError.divisionByZero

                    expect(value).to(equal(expectedValue))
                }
                it("failure - isEmpty") {
                    let setNumbers: [Double] = []

                    let single = sut.getMean(values: setNumbers)
                    let value = try? single.toBlocking().single().failure
                    let expectedValue = StatisticError.isEmpty

                    expect(value).to(equal(expectedValue))
                }
            }

            context("Median test") {
                it("Success") {
                    let setNumbers = setNumbers.sorted()

                    let single = sut.getMedian(values: setNumbers)
                    let value = try? single.toBlocking().single().success
                    var expectedValue: Double {
                        let isPair = setNumbers.count % 2 == 0 ? 1 : 0
                        let numbersToRemove = (setNumbers.count / 2) - isPair
                        return setNumbers
                            .dropFirst(numbersToRemove)
                            .dropLast(numbersToRemove)
                            .average()
                    }

                    expect(value).to(equal(expectedValue))
                }
                it("failure - isEmpty") {
                    let setNumbers: [Double] = []

                    let single = sut.getMedian(values: setNumbers)
                    let value = try? single.toBlocking().single().failure
                    let expectedValue = StatisticError.isEmpty

                    expect(value).to(equal(expectedValue))
                }
            }
        }
    }
}
