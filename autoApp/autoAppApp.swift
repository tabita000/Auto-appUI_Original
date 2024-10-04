//
//  autoAppApp.swift
//  autoApp
//
//  Created by Tabita Sadiq on 9/26/24.
//

import SwiftUI

@main
struct autoAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
