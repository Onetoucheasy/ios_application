//
//  OfferListViewModelForTest.swift
//  RestauranteOfertasTests
//
//  Created by Camila Laura Lopez on 10/9/23.
//

import Foundation
import Combine

@MainActor
class OfferListViewModelForTest: ObservableObject, OfferListViewModelProtocol {
    
    @Published var isLoading = false
    @Published var restaurantsOfferNested: [Restaurant]?
    @Published var status = Status.none
    //var suscriptors = Set<AnyCancellable>()
    
    init() {
        
    }
    
    func getActiveOffers () async throws {
        
        isLoading = true
        defer { isLoading = false }
        
        loadActiveOfferTesting()
        
    }
    
    func loadActiveOfferTesting() -> Void {
        let r1 = Restaurant(id: UUID(), name: "Restaurant 1", type: "Sushi", picture: "https://images.pexels.com/photos/18078297/pexels-photo-18078297/free-photo-of-ciudad-calle-barra-urbano.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        offers: [Offer(
            id: UUID(),
            title: "Primera Oferta",
            description: "Disfruta doble la comida.",
            image: "https://media.glamour.es/photos/616f6ddd16c8b9c6f6317eaf/master/w_1600%2Cc_limit/742412.jpg",
            startHour: Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date(),
            endHour: Calendar.current.date(byAdding: .hour, value: 3, to: Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()) ?? Date())])
        let r2 = Restaurant(id: UUID(), name: "Restaurant 2", type: "Pizza", picture: "https://images.pexels.com/photos/18078297/pexels-photo-18078297/free-photo-of-ciudad-calle-barra-urbano.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        offers: [Offer(
            id: UUID(),
            title: "Primera Oferta",
            description: "Disfruta doble la comida.",
            image: "https://media.glamour.es/photos/616f6ddd16c8b9c6f6317eaf/master/w_1600%2Cc_limit/742412.jpg",
            startHour: Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date(),
            endHour: Calendar.current.date(byAdding: .hour, value: 3, to: Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()) ?? Date())])
            
        self.restaurantsOfferNested = [r1, r2]
    }
}
