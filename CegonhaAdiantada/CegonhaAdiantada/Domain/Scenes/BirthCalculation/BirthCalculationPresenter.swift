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
        let days = String(response.days ?? .zero)
        let weeks = String(response.weeks ?? .zero)
        let totalDays = String(response.totalDays ?? .zero)
        
        view?.display(viewModel: ViewModel(weeks: weeks, days: days, totalDays: totalDays))
    }
}
