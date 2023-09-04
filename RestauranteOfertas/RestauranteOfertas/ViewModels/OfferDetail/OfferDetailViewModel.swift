//
//  OfferDetailViewModel.swift
//  RestauranteOfertas
//
//  Created by Camila Laura Lopez on 2/9/23.
//

import Foundation
import Combine


final class OfferDetailViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var offer: Offer?
    @Published var status = Status.none
    var suscriptors = Set<AnyCancellable>()
    var offerID: UUID
        
    enum Status {
        case none, loading, ready, error(error: String)
    }

     init(offerID: UUID){
         self.offerID = offerID
    }
     
     func getOfferByID(id: UUID) async throws {
         
         isLoading = true
         defer { isLoading = false }
         
         do {
             let response = try await OffersEndpoint.offer(id: id).request(type: Offer.self)
             offer = response
             
         } catch let decodingError as DecodingError {
             print("DecodingError: \(decodingError)")
         } catch {
             print("General Error: \(error)")
         }
      }
    
    func loadSampleDataLocally() {
        if let url = Bundle.main.url(forResource: "SampleOfferForDetail", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601 // decoding ISO8601 formatted dates from the JSON
                let response = try decoder.decode(Offer.self, from: data)
               
                print("loadSampleData > restaurants: \(String(describing: response))\n")
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
    }
}
    


