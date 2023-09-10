//
//  OfferListViewModel.swift
//  RestauranteOfertas
//
//  Created by Enrique Poyato Ortiz on 7/8/23.
//

import SwiftUI
import Foundation // for Status enum
import Combine // used fro AnyCancellable

@MainActor
class OfferListViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var restaurantsOfferNested: [Restaurant]?
    @Published var status = Status.none
    var suscriptors = Set<AnyCancellable>()
    
    
    init() {
        
    }
    
    func getActiveOffers () async throws {
        
        isLoading = true
        defer { isLoading = false }
        
        do {
            let response = try await OffersEndpoint.restaurantWithOffer.request(type: OffersResponse.self)
            restaurantsOfferNested = response.result
            print("getActiveOffers > restaurants: \(String(describing: restaurantsOfferNested))\n")
            
        } catch let decodingError as DecodingError {
            print("DecodingError: \(decodingError)")
        } catch {
            print("General Error: \(error)")
        }
        
    }
}
