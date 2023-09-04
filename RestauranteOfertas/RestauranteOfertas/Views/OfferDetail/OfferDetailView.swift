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
        VStack{
            
            ScrollView(.vertical){
                OfferDetailCardView(viewModel: viewModel, offer: offer, restaurant: restaurant)
            }
        }
    }
}

struct OfferDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OfferDetailView(viewModel: OfferDetailViewModel(offerID: UUID()), offer: Offer(id: UUID(), offerName: "Primera Oferta", description: "Disfruta doble la comida.", image: "https://example.com/article1"), restaurant: Restaurant(id: UUID(), name: "Restaurant test"))
    }
}

