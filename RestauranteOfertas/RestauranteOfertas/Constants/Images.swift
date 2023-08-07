//
//  Images.swift
//  RestauranteOfertas
//
//  Created by Eric Olsson on 7/25/23.
//

import SwiftUI

extension Image {
    
    enum Identifier {
        
        // custom images/icons
        case loginFoodImage
        case dragonRadar
        case onetoucheasy
        case Message
        case Crown
        case Padlock
        case LoginBackground
        case Hamburger
    }
    
    enum Symbol: String {
        
        // SF Symbol
        case xmarkCircleFill = "xmark.circle.fill"
        case personCircleFill = "person.circle.fill"
        case envelopeCircleFill = "envelope.circle.fill"
        case lockCircleFill = "lock.circle.fill"
        case home = "house"
        case settings = "gear"
        case char = "chart.bar.xaxis"
        case magnifyingglass = "magnifyingglass"
        
    }
}

extension Image {
    
    init(_ identifier: Image.Identifier) {
        self.init("\(identifier)")
    }
    
    init(_ symbol: Image.Symbol) {
        self.init(systemName: symbol.rawValue)
    }
}
