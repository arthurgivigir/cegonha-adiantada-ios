//
//  SavesPresenter.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 02/05/23.
//  
//
import Foundation

protocol SavesPresentationLogic {
    func present(response: Saves.LoadSaves.Response)
}

final class SavesPresenter {
    typealias Response = Saves.LoadSaves.Response
    typealias ViewModel = Saves.LoadSaves.ViewModel
    var view: SavesDisplayLogic?
}

extension SavesPresenter: SavesPresentationLogic {
    func present(response: Response) {
    //    view?.display(viewModel: viewModel)
    }
}