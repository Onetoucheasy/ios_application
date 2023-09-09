//
//  OfferListView.swift
//  RestauranteOfertas
//
//  Created by Enrique Poyato Ortiz on 7/8/23.
//

import SwiftUI

struct OfferListView: View {
    
    @StateObject var viewModel = OfferListViewModel()
    
    var body: some View {

        VStack{
            ScrollView(.vertical, showsIndicators: false) {
                if let restaurants = viewModel.restaurantsOfferNested{
                ForEach(restaurants) { restaurant in
                    VStack(alignment: .leading) {
                        Text(restaurant.name)
                            .font(.system(size: 20))
                            .foregroundColor(Color.black)
                            .bold()
                            .padding(.horizontal)
                        if let offers = restaurant.offers {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(offers){ offer in
                                        NavigationLink(destination: OfferDetailCardView(offer: offer, restaurant: restaurant)) {
                                            OfferCardView(offer: offer, restaurant: restaurant)
                                                .padding(.vertical)
                                                .padding(.horizontal, 10)
                                        }
                                    }
                                }
                            }
                        }
                    }
                  }
               }
            }
            Spacer()
        }
        .onAppear{
            
            Task {
                do {
                    try await viewModel.getActiveOffers()
                    
                } catch {
                    print("Error fetching active offers: \(error.localizedDescription)")
                }
            }
            print("\nOfferListView\n")
        }
    }
}

struct OfferListView_Previews: PreviewProvider {
    static var previews: some View {
        OfferListView()
    }
}
