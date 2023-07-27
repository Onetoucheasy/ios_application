//
//  ViewRouter.swift
//  RestauranteOfertas
//
//  Created by Eric Olsson on 7/26/23.
//

import SwiftUI

enum Screen {
    
    case splash
    case signIn
    case tabs
    
}

enum Tab {
    
//    case news
//    case episodes
    
}

class ViewRouter: ObservableObject {
    
    // MARK: - Properties
    @Published var screen: Screen = .splash
//    @Published var tab: Tab = .news
    
}
