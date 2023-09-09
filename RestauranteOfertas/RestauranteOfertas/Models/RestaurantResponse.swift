//
//  RestaurantResponse.swift
//  RestauranteOfertas
//
//  Created by Camila Laura Lopez on 9/9/23.
//

import Foundation


struct RestaurantResponse: Codable {
    let items: Int?
    let result: [RestaurantData]
}

struct RestaurantData: Codable, Identifiable {
    var id: UUID
    var name: String
    var type: String
    var picture: String
    var coordinates: Coordinate
    var address: Address
}

struct Coordinate: Codable, Identifiable {
    var id: UUID
    var longitude: Double
    var latitude: Double
}

struct Address: Codable {
    var city: String
    var country: String
    var zipCode: String
    var state: String
    var address: String
}
