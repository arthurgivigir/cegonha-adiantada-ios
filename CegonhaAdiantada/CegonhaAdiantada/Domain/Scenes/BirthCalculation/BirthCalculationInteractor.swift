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
    let defaults = UserDefaults.standard
}

extension BirthCalculationInteractor: BirthCalculationBusinessLogic {
    func calculateBabyBirthdays(request: Request) {
        let calculus = request.calculus
        var totalDays: Int = .zero
        var totalWeeks: Int = .zero
        let birthDays: Int = Int(calculus.days) ?? .zero
        let birthWeeks: Int = Int(calculus.weeks) ?? .zero
        let birthdayValue = calculus.birthDate

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
        
        let result = Result(weeks: String(totalWeeks), days: String(days), totalDays: String(totalDays))
        let calculusToBeSaved = Calculus(
            weeks: calculus.weeks,
            days: calculus.days,
            birthDate: calculus.birthDate,
            result: result
        )
        
        saveToUserDefaults(calculus: calculusToBeSaved)
        
        presenter?.present(response: Response(result: result, calculusToBeSaved: calculusToBeSaved))
        print("🚧 A criança tem \(totalWeeks) semanas e \(days) dia(s), um total de \(totalDays) dia(s).")
    }
}

private extension BirthCalculationInteractor {
    func saveToUserDefaults(calculus: Calculus) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(calculus)
            var results = defaults.object(forKey: "history") as? [Data] ?? []
            results.append(data)
            defaults.set(results, forKey: "history")
        } catch {
            print("⚠️ Unable to Encode Result (\(error))")
        }
    }
}
