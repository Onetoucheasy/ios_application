//
//  Offer.swift1
//  RestauranteOfertas
//
//  Created by Enrique Poyato Ortiz on 7/8/23.
//

import Foundation

struct Offer: Codable, Identifiable { // Android usa "Offers"
    var id: UUID
    var offerName: String?
    var description: String?
    var image: String?
    var distance: Int?
    var startTime: Date?
    var endTime: Date?
    var postTime: Date?
    var favorite: Bool?
}

