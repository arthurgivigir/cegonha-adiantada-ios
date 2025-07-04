//
//  HistoryDataModel.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 28/04/23.
//  
//
import Foundation

enum HistoryData {
    enum LoadHistoryData {
        struct Request {}
        
        struct Response {
            var calculus: [Calculus]
        }
        
        struct ViewModel {
            var calculus: [Calculus]
        }
    }
}
