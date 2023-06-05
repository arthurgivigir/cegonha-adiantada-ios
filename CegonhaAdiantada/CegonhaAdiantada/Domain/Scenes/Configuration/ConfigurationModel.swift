//
//  ConfigurationModel.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 02/05/23.
//  
//
import Foundation

enum ConfigurationModel {
    enum LoadConfiguration {
        struct Request {}
        
        struct Response {
            var coffees: [CoffeeProduct] = []
        }
        
        struct ViewModel {
            var coffees: [CoffeeProduct] = []
        }
    }
    
    enum PurchaseTips {
        struct Request {
            var coffee: Coffee
        }
    }
}
