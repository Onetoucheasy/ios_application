//
//  RestauranteOfertasApp.swift
//  RestauranteOfertas
//
//  Created by Eric Olsson on 7/25/23.
//

import SwiftUI

@main
struct RestauranteOfertasApp: App {

    @StateObject private var rootViewModel = RootViewModel()
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            RootView().environmentObject(rootViewModel)
//            LoginView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
