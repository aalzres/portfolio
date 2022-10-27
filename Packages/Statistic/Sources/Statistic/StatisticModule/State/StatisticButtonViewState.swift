//
//  StatisticButtonViewState.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/8/22.
//

import Architecture

protocol StatisticButtonViewState: BaseUICollectionViewState {
    var title: String { get }
}

struct StatisticButtonViewStateImpl: StatisticButtonViewState {
    let title: String
}

struct StatisticDigitButtonViewState: StatisticButtonViewState {
    let title: String
}

struct StatisticDeleteButtonViewState: StatisticButtonViewState {
    let title: String
}

struct StatisticRemoveButtonViewState: StatisticButtonViewState {
    let title: String
}

struct StatisticCalcButtonViewState: StatisticButtonViewState {
    let title: String
}
