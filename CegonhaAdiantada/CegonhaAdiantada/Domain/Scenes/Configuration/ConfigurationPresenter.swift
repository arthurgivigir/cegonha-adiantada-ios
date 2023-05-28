//
//  ConfigurationPresenter.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 02/05/23.
//  
//
import Foundation

protocol ConfigurationPresentationLogic {
    func present(response: ConfigurationModel.LoadConfiguration.Response)
    func thanksAlert()
}

final class ConfigurationPresenter {
    typealias Response = ConfigurationModel.LoadConfiguration.Response
    typealias ViewModel = ConfigurationModel.LoadConfiguration.ViewModel
    var view: ConfigurationDisplayLogic?
}

extension ConfigurationPresenter: ConfigurationPresentationLogic {
    func thanksAlert() {
        view?.showThanks()
    }
    
    func present(response: Response) {
        view?.display(viewModel: ViewModel(coffees: response.coffees))
    }
}
