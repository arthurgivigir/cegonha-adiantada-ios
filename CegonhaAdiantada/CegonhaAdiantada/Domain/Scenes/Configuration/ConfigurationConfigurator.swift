//
//  ConfigurationConfigurator.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 02/05/23.
//  
//
import SwiftUI

extension ConfigurationView {
    func configureView() -> some View {
        var view = self
        let interactor = ConfigurationInteractor()
        let presenter = ConfigurationPresenter()
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        return view
    }
}
