//
//  BirthCalculationModel.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 14/04/23.
//  
//
import Foundation

enum BirthCalculation {
    enum LoadBirthCalculation {
        struct Request {
            var calculus = Calculus()
        }
        
        struct Response {
            var result = Result()
            var calculusToBeSaved: Calculus? = nil
        }
        
        struct ViewModel {
            var result = Result()
            var calculusToBeSaved: Calculus? = nil
        }
    }
}
