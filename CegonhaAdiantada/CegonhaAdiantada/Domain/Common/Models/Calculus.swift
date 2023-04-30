//
//  Calculus.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 28/04/23.
//

import Foundation

struct Calculus {
    let weeks: String
    let days: String
    let date: Date
    let result: Result
    
    init(
        weeks: String = .zero,
        days: String = .zero,
        date: Date = .now,
        result: Result = .init()
    ) {
        self.weeks = weeks
        self.days = days
        self.date = date
        self.result = result
    }
}

struct Result {
    let weeks: String
    let days: String
    let totalDays: String
    
    init(
        weeks: String = .zero,
        days: String = .zero,
        totalDays: String = .zero
    ) {
        self.weeks = weeks
        self.days = days
        self.totalDays = totalDays
    }
}
