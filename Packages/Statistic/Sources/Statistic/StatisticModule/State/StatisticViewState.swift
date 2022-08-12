//
//  StatisticViewState.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/8/22.
//

import Architecture
import UserInterface

import SwifterSwift

struct StatisticViewState: BaseViewState {
    var isLoading: Bool = false
    var alert: AlertRepresentable?

    private(set) var setOfNumbers: String = ""
    private(set) var meanResult: String = ""
    private(set) var medianResult: String = ""
    private(set) var customButtonList: [StatisticButtonViewState] = []
}

extension StatisticViewState {
    var meanResultText: String {
        "statistic_mean_description".localizedWith(args: meanResult)
    }
    var medianResultText: String {
        "statistic_median_description".localizedWith(args: medianResult)
    }
    var setOfNumbersToDouble: [Double] {
        setOfNumbers.split(separator: ",").compactMap(Double.init)
    }
}
