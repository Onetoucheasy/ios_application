//
//  RestaurantCardView.swift
//  RestauranteOfertas
//
//  Created by Camila Laura Lopez on 9/9/23.
//

import SwiftUI

struct RestaurantCardView: View {
    var restaurant: RestaurantData
    var backgroundImage: Image
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                .fill(Color.white)
                .frame(width: 341, height: 190)
                .shadow(color: Color.gray, radius: 5, x: 0, y: 2)
                .overlay(
                    VStack(alignment: .leading) {
                        AsyncImage(url: URL(string: "\(restaurant.picture)")) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(maxWidth: .infinity, maxHeight: 120)
                                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 0)))
                                    .opacity(0.8)
                                    .overlay(alignment: .bottom) {
                                        VStack(alignment: .leading) {
                                            LinearGradient(gradient: Gradient(colors: [Color.clear, Color.clear]), startPoint: .top, endPoint: .bottom)
                                                .frame(maxWidth: .infinity, maxHeight: 95)
                                                .overlay(alignment: .leading) {
                                                    HStack {
                                                        Image("Logo")
                                                        Text(restaurant.name)
                                                            .font(.system(size: 24))
                                                            .foregroundColor(Color.white)
                                                            .padding(.leading)
                                                            .bold()
                                                        
                                                    }
                                                    .padding(.horizontal)
                                                }
                                                .overlay(alignment: .topTrailing) {
                                                    Image(systemName: "heart")
                                                        .imageScale(.large)
                                                        .fontWeight(.semibold)
                                                        .foregroundColor(.white)
                                                        .padding(8)
                                                }
                                        }
                                    }
                            } else if phase.error != nil {
                                Text("Something went wrong with this image")
                                    .font(.system(size: 14))
                                    .frame(maxWidth: .infinity, alignment: .center)
                            } else {
                                ProgressView()
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                        }
                        .offset(y: -14)
                        
                        VStack (alignment: .leading) {
                            Text("\(restaurant.address.address)")
                                .font(.system(size: 18))
                                .foregroundColor(Color.black)
                                .bold()
                            
                            Text("\(restaurant.address.zipCode) - \(restaurant.address.city)")
                                .font(.system(size: 16))
                                .foregroundColor(Color.black)
                        }
                        .padding(.leading, 8)
                }
            )
        }
    }
}

struct RestaurantCardView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantCardView(
            restaurant: RestaurantData(
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
                    address: "Calle Desengaño nº 21")), backgroundImage: Image(""))
    }
}
