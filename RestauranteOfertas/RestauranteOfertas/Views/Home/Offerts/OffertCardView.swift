//
//  OfferCardView.swift
//  RestauranteOfertas
//
//  Created by Enrique Poyato Ortiz on 7/8/23.
//

import SwiftUI

struct OfferCardView: View {
    var offer: Offer
    var restaurant: Restaurant
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                .fill(Color.white)
                .frame(width: 341, height: 190)
                .shadow(color: Color.gray, radius: 5, x: 0, y: 2)
                .overlay(
                    VStack(alignment: .leading) {
                        AsyncImage(url: URL(string: "\(offer.image)")) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(maxWidth: .infinity, maxHeight: 120)
                                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 0)))
                                    .overlay(alignment: .bottom) {
                                VStack(alignment: .leading) {
                                        LinearGradient(gradient: Gradient(colors: [Color.clear, Color.white.opacity(0)]), startPoint: .top, endPoint: .bottom)
                                            .frame(maxWidth: .infinity, maxHeight: 95)
                                            .overlay(alignment: .leading) {
                                                HStack {
                                                 Image("Logo")
                                                }
                                                .padding(.horizontal)
                                                }
                                                .overlay(alignment: .center) {
                                                Text(restaurant.name)
                                                  .font(.system(size: 24))
                                                  .foregroundColor(Color.white)
                                                  .bold()
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
                        VStack {
                            Text(offer.title)
                              .font(.system(size: 18))
                              .foregroundColor(Color.black)
                              .bold()
                              
                            Text(TimeFormattingUtility.getFormattedTime(date: offer.startHour) + " to " + TimeFormattingUtility.getFormattedTime(date: offer.endHour))
                        }
                        .frame(maxWidth: .infinity, alignment: .bottomLeading)
                        .font(.system(size: 14))
                        .padding(.leading, 8)
                    }
                )
        }
    }
}

struct OfferCardView_Previews: PreviewProvider {
    static var previews: some View {
        OfferCardView(
            offer:
                Offer(
                    id: UUID(uuidString: "aaccca5f-349c-494a-97a0-16d9f57e32ca")!,
                    title: "Pack Sorpresa",
                    description: "Doble el valor...",
                    image: "https://media.glamour.es/photos/616f6ddd16c8b9c6f6317eaf/master/w_1600%2Cc_limit/742412.jpg",
                    startHour: Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date(),
                    endHour: Calendar.current.date(byAdding: .hour, value: 3, to: Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()) ?? Date(),
                    postTime: Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date(),
                    favorite: false
                ),
            restaurant:
                Restaurant(
                    id: UUID(uuidString: "165eb19d-47a7-48b8-b354-4a44b9a707de")!,
                    name: "Tapas Bar",
                    type: "Espanol",
                    picture: "https://media.glamour.es/photos/616f6ddd16c8b9c6f6317eaf/master/w_1600%2Cc_limit/742412.jpg")
        )
    }
}
