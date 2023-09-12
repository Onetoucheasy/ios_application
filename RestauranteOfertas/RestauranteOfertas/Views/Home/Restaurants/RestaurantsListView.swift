//
//  RestaurantsListView.swift
//  RestauranteOfertas
//
//  Created by Camila Laura Lopez on 9/9/23.
//

import SwiftUI

struct RestaurantsListView: View {
    
    @StateObject var viewModel = RestaurantListViewModel()
    var body: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false) {
                if let restaurants = viewModel.restaurants{
                    ForEach(restaurants) { restaurant in
                        VStack(alignment: .center) {
                            RestaurantCardView(restaurant: restaurant, backgroundImage: Image(restaurant.picture))
                                .padding(.vertical)
                                .padding(.horizontal, 10)
                        }
                    }
                }
            }
            Spacer()
        }
        .onAppear{
            
            Task {
                do {
                    try await viewModel.getAllRestaurant()
                } catch {
                    print("Error fetching restaurants: \(error.localizedDescription)")
                }
            }
        }
    }
}

struct RestaurantsListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantsListView()
    }
}
