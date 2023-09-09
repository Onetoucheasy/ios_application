//
//  OfferDetailView.swift
//  RestauranteOfertas
//
//  Created by Camila Laura Lopez on 2/9/23.
//

import SwiftUI

struct OfferDetailView: View {
    
    @StateObject var viewModel = OfferDetailViewModel(offerID: UUID())
    var offer: Offer
    var restaurant: Restaurant
    
    var body: some View {
      
        OfferDetailCardView( offer: offer, restaurant: restaurant)
        
    }
}

struct OfferDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OfferDetailView(
            viewModel: OfferDetailViewModel(
                offerID: UUID()),
            offer: Offer(
                id: UUID(),
                title: "Primera Oferta",
                description: "Disfruta doble la comida.",
                image: "https://media.glamour.es/photos/616f6ddd16c8b9c6f6317eaf/master/w_1600%2Cc_limit/742412.jpg",
                startHour: Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date(),
                endHour: Calendar.current.date(byAdding: .hour, value: 3, to: Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()) ?? Date()),
            restaurant: Restaurant(
                id: UUID(),
                name: "Restaurant test",
                type: "Chino",
                picture:"https://media.glamour.es/photos/616f6ddd16c8b9c6f6317eaf/master/w_1600%2Cc_limit/742412.jpg")
        )
    }
}

