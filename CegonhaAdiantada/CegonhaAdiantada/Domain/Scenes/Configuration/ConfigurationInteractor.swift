//
//  ConfigurationInteractor.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 02/05/23.
//  
//
import Foundation

protocol ConfigurationBusinessLogic {
    func load(request: Configuration.LoadConfiguration.Request)
}

final class ConfigurationInteractor {
    typealias Request = Configuration.LoadConfiguration.Request
    typealias Response = Configuration.LoadConfiguration.Response
    var presenter: ConfigurationPresentationLogic?
}

extension ConfigurationInteractor: ConfigurationBusinessLogic {
    func load(request: Request) {
        // presenter?.present(response:  Response)
    }
}
