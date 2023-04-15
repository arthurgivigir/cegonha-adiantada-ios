//
//  BirthCalculationConfigurator.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 14/04/23.
//  
//
import SwiftUI

extension BirthCalculationView {
    func configureView() -> some View {
        var view = self
        let interactor = BirthCalculationInteractor()
        let presenter = BirthCalculationPresenter()
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        return view
    }
}
