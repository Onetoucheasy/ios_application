//
//  OfferListViewModel.swift
//  RestauranteOfertas
//
//  Created by Enrique Poyato Ortiz on 7/8/23.
//

import SwiftUI
import JWTDecode // Do I use this? CloudDragon NewViewModel does not...
import Foundation // for Status enum
import Combine // used fro AnyCancellable
@MainActor
class OfferListViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var isLoading = false
//    @Published var offers = [Offer]()//.self
    @Published var offersNested = [RestaurantNest.OfferNested]()
    @Published var restaurants: [Restaurant]? // use this as main object and the pluck out offers..?
//    @Published var restaurantsNested: [RestaurantNest]? // Experiment fm Marc
    @Published var status = StatusV2.none // fm V2
    var suscriptors = Set<AnyCancellable>() // fm V2
    
    init() {
//        self.restaurants = getRestaurants() // defined in Restaurant model
        // init may not be required...
    }
    
    // MARK: - CloudDragon method, using Endpoint for API call for active offers, using access token
    // Benefit: simply able to make URL request w parameters AND decode nested models like Marvel's
    
    func getActiveOffers () async throws { // token gets passed in OfferEndpoint
        
        print("getActiveOffers...\n") 
        isLoading = true
        defer { isLoading = false }
        
        do {
            // decode OffersResponse first, and then extract the restaurants array from it
            let response = try await OffersEndpoint.all.request(type: OffersResponse.self)
            restaurants = response.restaurants
            
            // verify output
            print("getActiveOffers > restaurants: \(String(describing: restaurants))\n") // works!
        } catch let decodingError as DecodingError {
            print("DecodingError: \(decodingError)")
        } catch {
            print("General Error: \(error)")
        }
        
    }
    
    // fetch restaurants and offers from local json file
    func loadSampleDataLocally() {
        if let url = Bundle.main.url(forResource: "SampleOfferListResponse", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601 // decoding ISO8601 formatted dates from the JSON
                let response = try decoder.decode(OffersResponse.self, from: data)
                restaurants = response.restaurants
                print("loadSampleData > restaurants: \(String(describing: restaurants))\n")
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
    }
    
    func getOffersV2() {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        URLSession.shared
            .dataTaskPublisher(for: ApiService.shared.activeOffersRequest())
            .tryMap{
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else{
                    throw URLError(.badServerResponse)
                }
                print("\($0.data)\n") // prints something like "4854 bytes"
                print("response: \(response)\n") // prints 4 or 5 lines
                
                // Convert data to human-readable JSON string
                if let jsonObject = try? JSONSerialization.jsonObject(with: $0.data, options: []),
                   let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted]),
                   let jsonString = String(data: jsonData, encoding: .utf8) {
                    print("Raw JSON Response:\n\(jsonString)\n") // now prints
                } else {
                    print("Could not format raw JSON.\n")
                }
                return $0.data
            }
            .tryCatch { error -> AnyPublisher<Data, Error> in  // Here's where we catch the decoding error
                        if let decodingError = error as? DecodingError {
                            switch decodingError {
                            case .keyNotFound(let key, let context):
                                print("Key not found: \(key.stringValue) in JSON: \(context.debugDescription)")
                            case .valueNotFound(let type, let context):
                                print("Value not found of type \(type) in JSON: \(context.debugDescription)")
                            case .typeMismatch(let type, let context):
                                print("Type mismatch for type \(type) in JSON: \(context.debugDescription)")
                            default:
                                print("Other decoding error: \(decodingError)")
                            }
                        }
                        throw error  // Propagate the error down the chain
                    }
            .decode(type: OffersResponse.self, decoder: decoder) // was decoder: JSONDecoder()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .failure(let error):
                    self.status = StatusV2.error(error: "Error finding offers: \(error.localizedDescription)")
                    print("offers sink failure: \(error.localizedDescription)\n") // current case
                case .finished:
                    self.status = .loaded
                    print("offers sink finished\n")
                }
            } receiveValue: { data in
                self.restaurants = data.restaurants
//                self.offers = data.restaurants.
                print("getOffersV2 restaurants: \(String(describing: self.restaurants))\n")
//                print("getOffersV2 offers: \(String(describing: self.offers))\n")
            }
            .store(in: &suscriptors)
    }
}

enum StatusV2 {
    case none, loading, loaded, error(error: String)
}
