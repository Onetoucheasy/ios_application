//
//  OfferDetailCardView.swift
//  RestauranteOfertas
//
//  Created by Camila Laura Lopez on 3/9/23.
//

import SwiftUI

struct OfferDetailCardView: View {
    
    var viewModel: OfferDetailViewModel
    var offer: Offer
    var restaurant: Restaurant
    
    var body: some View {
        VStack {
            
                OfferCardContent(offer: offer)
                
                RestaurantCardContent(restaurant: restaurant)
        }
    }
    
    struct OfferCardContent: View {
        
        var offer: Offer
        
        var body: some View{
            
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .frame(width: 341, height: 190)
                .shadow(color: Color.gray, radius: 5, x: 0, y: 2)
                .overlay(alignment: .bottom) {
                    
                    VStack(alignment: .leading) {
                        Text("\(offer.offerName ?? "Offer Name not found")")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(10)
                            .bold()
                            .id(0)
                        
                        AsyncImage(url: URL(string: "\(offer.image ?? "https://es.123rf.com/photo_154725527_hamburguesas-estilos-l%C3%ADneas-minimalistas-dise%C3%B1os.html")")) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .cornerRadius(5)
                                    .opacity(0.78)
                                    .id(1)
                            } else if phase.error != nil {
                                Text("Something went wrong with this image")
                            } else {
                                ProgressView()
                            }
                        }
                        
                        Text("\(offer.description ?? "No description found")")
                            .font(.title3)
                            .padding([.leading, .trailing], 20)
                            .foregroundColor(.gray)
                            .bold()
                            .id(2)
                    }
                }
        }
    }
}
   
struct RestaurantCardContent: View {
    var restaurant: Restaurant
    
    var body: some View{
        
        RoundedRectangle(cornerRadius: 15)
            .fill(Color.white)
            .frame(width: 341, height: 190)
            .shadow(color: Color.gray, radius: 5, x: 0, y: 2)
            .overlay(alignment: .bottom) {
                
                VStack(alignment: .leading) {
                    
                    AsyncImage(url: URL(string: "\(restaurant.offers?.first?.image ?? "https://es.123rf.com/photo_154725527_hamburguesas-estilos-l%C3%ADneas-minimalistas-dise%C3%B1os.html")")) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .cornerRadius(5)
                                .opacity(0.78)
                                .id(1)
                            
                            LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3), Color.clear]), startPoint: .bottom, endPoint: .top)
                            
                            Text("\(restaurant.name)")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding(10)
                                .bold()
                                .id(0)
                            
                        } else if phase.error != nil {
                            Text("Something went wrong with this image")
                        } else {
                            ProgressView()
                        }
                    }
                }
            }
    }
}

struct OfferDetailCardView_Previews: PreviewProvider {
    static var previews: some View {
        OfferDetailCardView(viewModel: OfferDetailViewModel(offerID: UUID()), offer: Offer(id: UUID(), offerName: "Primera Oferta", description: "Disfruta doble la comida.", image: "https://example.com/article1"), restaurant: Restaurant(id: UUID(), name: "Restaurant test"))
    }
}
