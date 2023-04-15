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
}
