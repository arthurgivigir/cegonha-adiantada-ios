//
//  HistoryDataInteractor.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 28/04/23.
//  
//
import Foundation

protocol HistoryDataBusinessLogic {
    func load(request: HistoryData.LoadHistoryData.Request)
}

final class HistoryDataInteractor {
    typealias Request = HistoryData.LoadHistoryData.Request
    typealias Response = HistoryData.LoadHistoryData.Response
    var presenter: HistoryDataPresentationLogic?
    let defaults = UserDefaults.standard
}

extension HistoryDataInteractor: HistoryDataBusinessLogic {
    func load(request: Request) {
        let results = defaults.object(forKey: "history") as? [Data] ?? []
        let calculus = results.toCalculus()
        presenter?.present(response:  Response(calculus: calculus))
    }
}
