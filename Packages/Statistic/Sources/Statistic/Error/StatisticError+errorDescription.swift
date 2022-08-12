//
//  StatisticError+errorDescription.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/8/22.
//

extension StatisticError {
    var errorDescription: String {
        switch self {
        case .divisionByZero:
            return "error_division_by_zero".localized()
        case .isEmpty:
            return "error_parameters".localized()
        }
    }
}
