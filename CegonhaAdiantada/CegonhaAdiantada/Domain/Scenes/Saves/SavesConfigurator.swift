//
//  SavesConfigurator.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 02/05/23.
//  
//
import SwiftUI

extension SavesView {
    func configureView() -> some View {
        var view = self
        let interactor = SavesInteractor()
        let presenter = SavesPresenter()
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        return view
    }
}
