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
            if let restaurants = viewModel.restaurants {
                ForEach(restaurants) { restaurant in
                    VStack(alignment: .leading) {
                        Text(restaurant.name)
                            .font(.system(size: 20))
                            //.foregroundColor(Color(hex: 0xFF8585))
                            .foregroundColor(Color.red)
                            
                            .bold()
                            .padding(.horizontal)
                        if let offers = restaurant.offers {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(offers){ Offer in
                                        OfferCardView(Offer: Offer, restaurant: restaurant, backgroundImage: Image("fondoRestaurant"))
                                            .padding(.vertical)
                                            .padding(.horizontal, 10)
                                            
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
            print("\nOfferListView\n")
            viewModel.getOffersV2()
        }
    }
}

struct OfferListView_Previews: PreviewProvider {
    static var previews: some View {
        OfferListView()
    }
}
