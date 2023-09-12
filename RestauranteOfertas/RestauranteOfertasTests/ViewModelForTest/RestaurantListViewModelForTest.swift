//
//  RestaurantListViewModelForTest.swift
//  RestauranteOfertasTests
//
//  Created by Camila Laura Lopez on 10/9/23.
//

import Foundation
import Combine

@MainActor
class RestaurantListViewModelForTest: ObservableObject, RestaurantListViewModelProtocol {
    
    @Published var isLoading = false
    @Published var restaurants: [RestaurantData]?
    @Published var status = Status.none
    var suscriptors = Set<AnyCancellable>()
    var fail: Bool = false
    
    init(fail: Bool) {
        self.fail = fail
    }
    
    func getAllRestaurant () async throws {
        
        isLoading = true
        defer { isLoading = false }
        print(self.fail)
        
        loadRestaurantTesting(fail: self.fail)
    }
    
    func loadRestaurantTesting(fail: Bool) -> Void {
        
        if(!fail){
            let r1 = RestaurantData(
                id: UUID(),
                name: "Shushi Bar",
                type: "Japonés",
                picture: "https://images.pexels.com/photos/18078297/pexels-photo-18078297/free-photo-of-ciudad-calle-barra-urbano.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                coordinates: Coordinate(
                    id: UUID(),
                    longitude: -3.3999999999999999,
                    latitude: 40.299999999999997),
                address: Address(
                    city: "Móstoles",
                    country: "Spain",
                    zipCode: "28661",
                    state: "Comunidad de Madrid",
                    address: "Calle Desengaño nº 21"))
            let r2 = RestaurantData(
                id: UUID(),
                name: "Shushi Bar",
                type: "Japonés",
                picture: "https://images.pexels.com/photos/18078297/pexels-photo-18078297/free-photo-of-ciudad-calle-barra-urbano.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                coordinates: Coordinate(
                    id: UUID(),
                    longitude: -3.3999999999999999,
                    latitude: 40.299999999999997),
                address: Address(
                    city: "Móstoles",
                    country: "Spain",
                    zipCode: "28661",
                    state: "Comunidad de Madrid",
                    address: "Calle Desengaño nº 21"))
            let r3 = RestaurantData(
                id: UUID(),
                name: "Shushi Bar",
                type: "Japonés",
                picture: "https://images.pexels.com/photos/18078297/pexels-photo-18078297/free-photo-of-ciudad-calle-barra-urbano.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                coordinates: Coordinate(
                    id: UUID(),
                    longitude: -3.3999999999999999,
                    latitude: 40.299999999999997),
                address: Address(
                    city: "Móstoles",
                    country: "Spain",
                    zipCode: "28661",
                    state: "Comunidad de Madrid",
                    address: "Calle Desengaño nº 21"))
            
            self.restaurants = [r1, r2, r3]
        }else{
            self.restaurants = nil
        }
    }
}
