//
//  OffertListViewModel.swift
//  RestauranteOfertas
//
//  Created by Enrique Poyato Ortiz on 7/8/23.
//

import Foundation

final class OffertViewViewModel: ObservableObject {
    @Published var restaurants: [Restaurant]?
    
    init() {
        self.restaurants = getRestaurants()
    }
}
