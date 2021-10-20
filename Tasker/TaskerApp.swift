//
//  TaskerApp.swift
//  Tasker
//
//  Created by Rohit Saini on 18/10/21.
//

import SwiftUI

@main
struct TaskerApp: App {
    let persistenceController = PersistenceController.shared
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
