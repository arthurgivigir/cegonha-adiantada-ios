//
//  BirthCalculationDataStore.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 14/04/23.
//  
//
import Foundation

final class BirthCalculationDataStore: ObservableObject {
    @Published var weeks: String = .empty
    @Published var days: String = .empty
    @Published var date: Date = .now
    @Published var showPopUp: Bool = false
    
    @Published var resultWeeks: String = .zero
    @Published var resultDays: String = .zero
    @Published var resultTotalDays: String = .zero
    
    @Published var selectedTabBar: Tab = .home
}
