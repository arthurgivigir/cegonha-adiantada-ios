//
//  SavesDataStore.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 02/05/23.
//  
//
import Foundation

final class SavesDataStore: ObservableObject {
    @Published var babyName: String = .empty
    @Published var saves: [Calculus] = []
    @Published var savedCalculus: Calculus? = nil
    @Published var showPopUp: Bool = false
    @Published var enableButton: Bool = false
}
