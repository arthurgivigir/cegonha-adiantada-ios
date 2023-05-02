//
//  SavesInteractor.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 02/05/23.
//  
//
import Foundation

protocol SavesBusinessLogic {
    func load(request: Saves.LoadSaves.Request)
}

final class SavesInteractor {
    typealias Request = Saves.LoadSaves.Request
    typealias Response = Saves.LoadSaves.Response
    var presenter: SavesPresentationLogic?
}

extension SavesInteractor: SavesBusinessLogic {
    func load(request: Request) {
        // presenter?.present(response:  Response)
    }
}
