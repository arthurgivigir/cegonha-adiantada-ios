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
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
}
