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
    let history = UserDefaults(suiteName: "group.com.givigir.CegonhaAdiantada")?.object(forKey: "history")
}

extension HistoryDataInteractor: HistoryDataBusinessLogic {
    func load(request: Request) {
        let results = history as? [Data] ?? []
        let calculus = results.toCalculus().sorted { $0.date > $1.date }
        presenter?.present(response:  Response(calculus: calculus))
    }
}
