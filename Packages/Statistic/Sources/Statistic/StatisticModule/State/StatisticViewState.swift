//
//  StatisticViewState.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/8/22.
//

import Architecture
import UserInterface

struct StatisticViewState: BaseViewState {
    var isLoading: Bool = false
    var alert: AlertRepresentable?

    private(set) var customButtonList: [StatisticButtonViewState] = [
        StatisticButtonViewState(title: "1"),
        StatisticButtonViewState(title: "2"),
        StatisticButtonViewState(title: "3"),
        StatisticButtonViewState(title: "4"),
        StatisticButtonViewState(title: "5"),
        StatisticButtonViewState(title: "6"),
        StatisticButtonViewState(title: "7"),
        StatisticButtonViewState(title: "8"),
        StatisticButtonViewState(title: "9"),
        StatisticButtonViewState(title: "0"),
        StatisticButtonViewState(title: "."),
        StatisticButtonViewState(title: ","),
        StatisticButtonViewState(title: "C"),
        StatisticButtonViewState(title: "<-"),
        StatisticButtonViewState(title: "="),
    ]
}
