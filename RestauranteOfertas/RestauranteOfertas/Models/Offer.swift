//
//  Offer.swift1
//  RestauranteOfertas
//
//  Created by Enrique Poyato Ortiz on 7/8/23.
//

import Foundation

struct Offer: Codable, Identifiable {
    var id: UUID
    var title: String
    var description: String?
    var image: String
    var startHour: Date
    var endHour: Date
    var postTime: Date?
    var favorite: Bool?
}
