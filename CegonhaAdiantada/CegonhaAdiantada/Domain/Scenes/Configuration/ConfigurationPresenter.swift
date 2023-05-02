//
//  ConfigurationPresenter.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 02/05/23.
//  
//
import Foundation

protocol ConfigurationPresentationLogic {
    func present(response: Configuration.LoadConfiguration.Response)
}

final class ConfigurationPresenter {
    typealias Response = Configuration.LoadConfiguration.Response
    typealias ViewModel = Configuration.LoadConfiguration.ViewModel
    var view: ConfigurationDisplayLogic?
}

extension ConfigurationPresenter: ConfigurationPresentationLogic {
    func present(response: Response) {
    //    view?.display(viewModel: viewModel)
    }
}