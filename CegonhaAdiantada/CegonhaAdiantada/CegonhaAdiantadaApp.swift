//
//  CegonhaAdiantadaApp.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 12/04/23.
//

import SwiftUI

@main
struct CegonhaAdiantadaApp: App {
//    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            BirthCalculationView().configureView()
        }
    }
}
