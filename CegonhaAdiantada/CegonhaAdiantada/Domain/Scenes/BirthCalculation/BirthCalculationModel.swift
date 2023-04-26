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
            var weeks: String?
            var days: String?
            var date: Date?
        }
        
        struct Response {
            var weeks: Int?
            var days: Int?
            var totalDays: Int?
        }
        
        struct ViewModel {
            var weeks: String = .empty
            var days: String = .empty
            var totalDays: String = .empty
        }
    }
}
