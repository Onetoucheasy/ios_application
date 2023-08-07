//
//  Offert.swift
//  RestauranteOfertas
//
//  Created by Enrique Poyato Ortiz on 7/8/23.
//

import Foundation

struct Offert: Identifiable {
    var id: UUID = UUID()
    var offertName: String
    var distance: Int
    var startTime: Date
    var endTime: Date
    var favorite: Bool = false
    
}

