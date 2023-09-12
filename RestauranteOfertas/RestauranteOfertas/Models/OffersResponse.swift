//
//  Restaurant.swift
//  RestauranteOfertas
//
//  Created by Enrique Poyato Ortiz on 7/8/23.
//

import Foundation

struct OffersResponse: Codable {
    let items: Int?
    let result: [Restaurant]
}

struct Restaurant: Codable, Identifiable {
    var id: UUID
    var name: String
    var type: String
    var picture: String
    var offers: [Offer]?
}
