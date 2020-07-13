//
//  TimeInterval+Extension.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 11/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

extension TimeInterval {
    func currentTimestamp() -> TimeInterval {
        return TimeInterval(NSDate().timeIntervalSince1970)
    }
}
