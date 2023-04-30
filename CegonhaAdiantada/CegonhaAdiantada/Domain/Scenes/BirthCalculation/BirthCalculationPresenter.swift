//
//  BirthCalculationPresenter.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 14/04/23.
//  
//
import Foundation

protocol BirthCalculationPresentationLogic {
    func present(response: BirthCalculation.LoadBirthCalculation.Response)
}

final class BirthCalculationPresenter {
    typealias Response = BirthCalculation.LoadBirthCalculation.Response
    typealias ViewModel = BirthCalculation.LoadBirthCalculation.ViewModel
    var view: BirthCalculationDisplayLogic?
}

extension BirthCalculationPresenter: BirthCalculationPresentationLogic {
    func present(response: Response) {
        let days = String(response.result.days)
        let weeks = String(response.result.weeks)
        let totalDays = String(response.result.totalDays)
        
        view?.display(viewModel: ViewModel(result: Result(weeks: weeks, days: days, totalDays: totalDays)))
    }
}
