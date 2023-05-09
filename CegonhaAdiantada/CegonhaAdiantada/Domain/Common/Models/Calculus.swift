//
//  Calculus.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 28/04/23.
//

import Foundation

struct Calculus: Codable, Hashable {
    private(set) var id = UUID()
    
    let date: Date
    let weeks: String
    let days: String
    let birthDate: Date
    let result: Result
    let baby: Baby?
    
    init(
        date: Date = .now,
        weeks: String = .zero,
        days: String = .zero,
        birthDate: Date = .now,
        result: Result = .init(),
        baby: Baby? = nil
    ) {
        self.date = date
        self.weeks = weeks
        self.days = days
        self.birthDate = birthDate
        self.result = result
        self.baby = baby
    }
}

struct Result: Codable, Hashable {
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

struct Baby: Codable, Hashable {
    let name: String
    let place: String
    
    init(
        name: String = "",
        place: String = ""
    ) {
        self.name = name
        self.place = place
    }
}

extension Array where Element == Data {
    func toCalculus() -> [Calculus] {
        compactMap { data in
            data.toCalculus()
        }
    }
}

extension String {
    var toCalculus: Calculus? {
        let data = self.data(using: .utf8, allowLossyConversion: false)
        return data?.toCalculus()
    }
}

extension Data {
    func toCalculus() -> Calculus? {
        var calculus: Calculus?
        do {
            let decoder = JSONDecoder()
            calculus = try decoder.decode(Calculus.self, from: self)

        } catch {
            print("⚠️ Unable to Decode Calculus (\(error))")
        }
        return calculus
    }
}
