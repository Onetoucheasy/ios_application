//
//  RestauranteOfertasApp.swift
//  RestauranteOfertas
//
//  Created by Eric Olsson on 7/25/23.
//

import SwiftUI

@main
struct RestauranteOfertasApp: App {

    @StateObject private var viewRouter = ViewRouter()

    var body: some Scene {
        WindowGroup {
            RootView().environmentObject(viewRouter)
        }
    }
}
