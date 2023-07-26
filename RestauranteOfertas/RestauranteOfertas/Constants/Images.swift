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
    }
    
    enum Symbol: String {
        
        // SF Symbol
        case xmarkCircleFill = "xmark.circle.fill"
        case personCircleFill = "person.circle.fill"
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
