//
//  Odev_8App.swift
//  Odev_8
//
//  Created by Merve Akçakaya on 28.09.2025.
//

import SwiftUI

@main
struct Odev_8App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
