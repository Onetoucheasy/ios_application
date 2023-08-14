//
//  ViewRouter.swift
//  RestauranteOfertas
//
//  Created by Eric Olsson on 7/26/23.
//

import SwiftUI

enum Screen {
    case welcome
    case signIn
    case signUp
    case loading
    case tabs //TODO: add here an entrance parameter?
}

enum Tab {
    case home
    case map
}
enum TabCompany{
    case home
    case statistics
}

class ViewRouter: ObservableObject {
    // MARK: - Properties
    @Published var screen: Screen = .signIn
    @Published var tabCustomer: Tab = .home
    @Published var tabCompany: TabCompany = .home
}
