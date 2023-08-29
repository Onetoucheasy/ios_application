//
//  Offer.swift1
//  RestauranteOfertas
//
//  Created by Enrique Poyato Ortiz on 7/8/23.
//

import Foundation

struct Offer: Codable, Identifiable { // Android usa "Offers"
    var id: UUID?// = UUID()
    var offerName: String
    var description: String
    var image: String // will use URL string
    var distance: Int // missing fm Android
    var startTime: Date
    var endTime: Date
    var postTime: Date // date when post will go live
    var favorite: Bool = false // missing fm Android
}

