//
//  iCoffeeApp.swift
//  iCoffee
//
//  Created by Hakan Tekir on 1.12.2022.
//

import SwiftUI

@main
struct iCoffeeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            SignUpView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
