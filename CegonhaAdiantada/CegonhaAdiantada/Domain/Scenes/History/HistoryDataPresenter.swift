//
//  HistoryDataPresenter.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 28/04/23.
//  
//
import Foundation

protocol HistoryDataPresentationLogic {
    func present(response: HistoryData.LoadHistoryData.Response)
}

final class HistoryDataPresenter {
    typealias Response = HistoryData.LoadHistoryData.Response
    typealias ViewModel = HistoryData.LoadHistoryData.ViewModel
    var view: HistoryDataDisplayLogic?
}

extension HistoryDataPresenter: HistoryDataPresentationLogic {
    func present(response: Response) {
        view?.display(viewModel: ViewModel(calculus: response.calculus))
    }
}
