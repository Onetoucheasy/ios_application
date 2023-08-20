//
//  OffertListView.swift
//  RestauranteOfertas
//
//  Created by Enrique Poyato Ortiz on 7/8/23.
//

import SwiftUI

struct OffertListView: View {
    @StateObject var viewModel = OffertViewViewModel()
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
                        if let offerts = restaurant.offerts {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(offerts){ offert in
                                        OffertCardView(offert: offert, restaurant: restaurant, backgroundImage: Image("fondoRestaurant"))
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
        
        
    }
}

struct OffertListView_Previews: PreviewProvider {
    static var previews: some View {
        OffertListView()
    }
}
