//
//  BirthCalculationInteractor.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 14/04/23.
//  
//
import Foundation
import InfiniteLoop

protocol BirthCalculationBusinessLogic {
    func calculateBabyBirthdays(request: BirthCalculation.LoadBirthCalculation.Request)
}

final class BirthCalculationInteractor {
    typealias Request = BirthCalculation.LoadBirthCalculation.Request
    typealias Response = BirthCalculation.LoadBirthCalculation.Response
    var presenter: BirthCalculationPresentationLogic?
}

extension BirthCalculationInteractor: BirthCalculationBusinessLogic {
    func calculateBabyBirthdays(request: Request) {
        var totalDays: Int = .zero
        var totalWeeks: Int = .zero
        let birthDays: Int = Int(request.days ?? .empty) ?? .zero
        let birthWeeks: Int = Int(request.weeks ?? .empty) ?? .zero
        let birthdayValue = request.date

        if let birthdayValue {
            let weeksUntilNow = Calendar.current.dateComponents([.weekOfYear, .day], from: birthdayValue, to: Date())
            var days = (weeksUntilNow.day ?? .zero) + birthDays
            var weeks = weeksUntilNow.weekOfYear ?? .zero
            
            let remainder = days % Date.week
            if remainder >= 0, remainder != birthDays {
                weeks += days / Date.week
                days = remainder
            }
            
            totalWeeks = birthWeeks + weeks
            totalDays = totalWeeks * Date.week + days
            
            print("🚧 A criança tem \(totalWeeks) semanas e \(days) dia(s), um total de \(totalDays) dia(s).")
        }
    }
}
