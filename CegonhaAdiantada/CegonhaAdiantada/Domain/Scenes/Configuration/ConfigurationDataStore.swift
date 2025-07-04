//
//  ConfigurationDataStore.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 02/05/23.
//  
//
import Foundation

final class ConfigurationDataStore: ObservableObject {
    @Published var coffees: [CoffeeProduct] = []
    @Published var showPopUp = false
    @Published var thanksAlert = false
    @Published var showLoading = false
}
