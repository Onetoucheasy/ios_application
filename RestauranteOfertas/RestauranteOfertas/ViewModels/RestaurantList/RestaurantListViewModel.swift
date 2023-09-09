//
//  RestaurantListViewModel.swift
//  RestauranteOfertas
//
//  Created by Camila Laura Lopez on 9/9/23.
//

import Foundation
import Combine

@MainActor
class RestaurantListViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var restaurants: [RestaurantData]?
    @Published var status = Status.none
    var suscriptors = Set<AnyCancellable>()
    
    init() {

    }
 
    func getAllRestaurant () async throws {
        
        isLoading = true
        defer { isLoading = false }
        
        do {
            let response = try await RestaurantEndpoint.all.request(type: RestaurantResponse.self)
            restaurants = response.result
        } catch let decodingError as DecodingError {
            print("DecodingError: \(decodingError)")
        } catch {
            print("General Error: \(error)")
        }
        
    }
}
