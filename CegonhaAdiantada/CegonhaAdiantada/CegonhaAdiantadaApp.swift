//
//  CegonhaAdiantadaApp.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 12/04/23.
//

import SwiftUI

@main
struct CegonhaAdiantadaApp: App {
    @Environment(\.scenePhase) var scenePhase
    
    @ObservedObject var savesData = SavesDataStore()
    @ObservedObject var birthCalculation = BirthCalculationDataStore()
    @ObservedObject var historyData = HistoryDataDataStore()
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            MainView(savesData: savesData, birthCalculation: birthCalculation, historyData: historyData)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
}
