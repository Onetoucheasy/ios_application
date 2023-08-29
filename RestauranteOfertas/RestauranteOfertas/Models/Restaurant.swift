//
//  Restaurant.swift
//  RestauranteOfertas
//
//  Created by Enrique Poyato Ortiz on 7/8/23.
//

import Foundation

struct OffersResponse: Codable {
    let totalResults: Int
    let restaurants: [Restaurant]
}

struct Restaurant: Codable, Identifiable { // Decodable
    var id: UUID//UUID?// = UUID()
    var name: String
    var type: String? // error, "offers sink failure: The data couldn’t be read because it is missing."
    var latitude: Double? // Double gave format errors...
    var longitude: Double? // Double gave format errors...
    var openingHour: String?//Date
    var closingHour: String?//Date
    var offers: [Offer]?
}

//func getRestaurants() -> [Restaurant] {
//    let startDate = Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()
//    let endDate = Calendar.current.date(byAdding: .hour, value: 3, to: startDate) ?? Date()
//
//    let restaurant1 = Restaurant(name: "Restaurante 1", offers: [Offer(offerName: "Pack Sorpresa", description: "2 por 1", image: "image.png", distance: 756, startTime: startDate, endTime: endDate, postTime: startDate), Offer(offerName: "Pack Sorpresa", description: "2 por 1", image: "image.png", distance: 756, startTime: startDate, endTime: endDate, postTime: startDate), Offer(offerName: "Pack Sorpresa", description: "2 por 1", image: "image.png", distance: 50, startTime: startDate, endTime: endDate, postTime: startDate), Offer(offerName: "Pack Sorpresa", description: "2 por 1", image: "image.png", distance: 756, startTime: startDate, endTime: endDate, postTime: startDate)])
//
//    let restaurant2 = Restaurant(name: "Restaurante 2", offers: [Offer(offerName: "Pack Sorpresa", description: "2 por 1", image: "image.png", distance: 460, startTime: startDate, endTime: endDate, postTime: startDate), Offer(offerName: "Pack Sorpresa", description: "2 por 1", image: "image.png", distance: 756, startTime: startDate, endTime: endDate, postTime: startDate), Offer(offerName: "Pack Sorpresa", description: "2 por 1", image: "image.png", distance: 200, startTime: startDate, endTime: endDate, postTime: startDate), Offer(offerName: "Pack Sorpresa", description: "2 por 1", image: "image.png", distance: 756, startTime: startDate, endTime: endDate, postTime: startDate)])
//
//    let restaurant3 = Restaurant(name: "Restaurante 3", offers: [Offer(offerName: "Pack Sorpresa", description: "2 por 1", image: "image.png", distance: 300, startTime: startDate, endTime: endDate, postTime: startDate)])
//
//    return [restaurant1, restaurant2, restaurant3]
//} // sample data

// MARK: - Explore Nested Model -

struct RestaurantNest: Decodable, Identifiable {
    var id: UUID = UUID()
    var name: String
    var offers: [OfferNested]
    struct OfferNested: Decodable {
        var id: UUID = UUID()
        var offerName: String
        var description: String
        var image: String
        var distance: Int
        var startTime: Date
        var endTime: Date
        var postTime: Date
        var favorite: Bool = false
    }
}

//func getRestaurantsNested() -> [RestaurantNest] {
//    let startDate = Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()
//    let endDate = Calendar.current.date(byAdding: .hour, value: 3, to: startDate) ?? Date()
//    
//    let restaurant1 = RestaurantNest(
//        name: "Restaurante 1",
//        offers: [
//            OfferNested(
//                offerName: "Pack Sorpresa",
//                description: "2 por 1",
//                image: "image.png",
//                distance: 756,
//                startTime: startDate,
//                endTime: endDate,
//                postTime: startDate
//            ),
//            OfferNested(
//                offerName: "Pack Sorpresa",
//                description: "2 por 1",
//                image: "image.png",
//                distance: 756,
//                startTime: startDate,
//                endTime: endDate,
//                postTime: startDate
//            ),
//            OfferNested(
//                offerName: "Pack Sorpresa",
//                description: "2 por 1",
//                image: "image.png",
//                distance: 756,
//                startTime: startDate,
//                endTime: endDate,
//                postTime: startDate
//            )
//        ]
//    )
//    
//    let restaurant2 = RestaurantNest(
//        name: "Restaurante 2",
//        offers: [
//            OfferNested(
//                offerName: "Pack Sorpresa",
//                description: "2 por 1",
//                image: "image.png",
//                distance: 460,
//                startTime: startDate,
//                endTime: endDate,
//                postTime: startDate
//            ),
//            OfferNested(
//                offerName: "Pack Sorpresa",
//                description: "2 por 1",
//                image: "image.png",
//                distance: 756,
//                startTime: startDate,
//                endTime: endDate,
//                postTime: startDate
//            ),
//            OfferNested(
//                offerName: "Pack Sorpresa",
//                description: "2 por 1",
//                image: "image.png",
//                distance: 200,
//                startTime: startDate,
//                endTime: endDate,
//                postTime: startDate
//            ),
//            OfferNested(
//                offerName: "Pack Sorpresa",
//                description: "2 por 1",
//                image: "image.png",
//                distance: 756,
//                startTime: startDate,
//                endTime: endDate,
//                postTime: startDate
//            )
//        ]
//    )
//    
//    let restaurant3 = RestaurantNest(
//        name: "Restaurante 3",
//        offers: [
//            OfferNested(
//                offerName: "Pack Sorpresa",
//                description: "2 por 1",
//                image: "image.png",
//                distance: 300,
//                startTime: startDate,
//                endTime: endDate,
//                postTime: startDate
//            )
//        ]
//    )
//    
//    return [restaurant1, restaurant2, restaurant3]
//}
