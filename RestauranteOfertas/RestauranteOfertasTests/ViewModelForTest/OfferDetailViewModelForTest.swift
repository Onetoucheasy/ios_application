//
//  OfferDetailViewModelForTest.swift
//  RestauranteOfertasTests
//
//  Created by Camila Laura Lopez on 10/9/23.
//

import Foundation

@MainActor
class OfferDetailViewModelForTest: ObservableObject, OfferDetailViewModelProtocol {
    
    @Published var isLoading = false
    @Published var offer: Offer?
    @Published var status = Status.none
    //var suscriptors = Set<AnyCancellable>()
    var offerID: UUID

    init(offerId: UUID) {
        self.offerID = offerId
    }
 
    func getOfferByID(id: UUID) async throws {
   
        isLoading = true
        defer { isLoading = false }
        
        loadOfferTesting(id: id)
    }
    
    func loadOfferTesting(id: UUID) -> Void {
        let o1 = Offer(
            id: UUID(uuidString: "d3b79cfe-501b-11ee-be56-0242ac120002")!,
            title: "Primera Oferta",
            description: "Disfruta doble la comida.",
            image: "https://media.glamour.es/photos/616f6ddd16c8b9c6f6317eaf/master/w_1600%2Cc_limit/742412.jpg",
            startHour: Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date(),
            endHour: Calendar.current.date(byAdding: .hour, value: 3, to: Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()) ?? Date())
            
        self.offer = o1
    }
}
