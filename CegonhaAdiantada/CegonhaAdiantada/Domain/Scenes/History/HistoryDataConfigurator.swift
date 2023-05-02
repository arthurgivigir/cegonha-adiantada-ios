//
//  HistoryDataConfigurator.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 28/04/23.
//  
//
import SwiftUI

extension HistoryDataView {
    func configureView() -> some View {
        var view = self
        let interactor = HistoryDataInteractor()
        let presenter = HistoryDataPresenter()
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        return view
    }
}
