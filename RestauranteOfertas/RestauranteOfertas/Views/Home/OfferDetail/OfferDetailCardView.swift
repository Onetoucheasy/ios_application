//
//  OfferDetailCardView.swift
//  RestauranteOfertas
//
//  Created by Camila Laura Lopez on 3/9/23.
//

import SwiftUI

struct OfferDetailCardView: View {
    
    var offer: Offer
    var restaurant: Restaurant
    
    var body: some View {
        
        ScrollView (.vertical, showsIndicators: false){
            OfferCardContent(offer: offer, restaurant: restaurant)
            ReviewContent()
            RestaurantCardContent(restaurant: restaurant)
        }
    }
}

struct OfferCardContent: View {
    
    var offer: Offer
    var restaurant: Restaurant
    
    var body: some View{
        RoundedRectangle(cornerRadius: 15)
            .fill(Color.white)
            .frame(width: .infinity, height: 550)
            .shadow(color: Color.gray, radius: 3, x: 0, y: 2)
            .overlay(alignment: .bottom) {
                VStack(alignment: .leading) {
                    
                    HStack{
                        Text("\(offer.title)")
                            .font(.system(size: 24))
                            .foregroundColor(Color.black)
                            .bold()
                        Spacer()
                        Image(systemName: "square.and.arrow.up")
                            .imageScale(.medium)
                            .padding(.horizontal)
                        
                        Image(systemName: "heart")
                            .imageScale(.large)
                    }
                    .padding(10)
                    
                    VStack(alignment: .leading){
                        Text("\(restaurant.name)")
                            .font(.system(size: 16))
                            .foregroundColor(Color.black)
                            .fontWeight(.semibold)
                        
                        Text("\(TimeFormattingUtility.getFormattedTime(date: offer.startHour)) hs a \(TimeFormattingUtility.getFormattedTime(date: offer.endHour)) hs")
                            .font(.system(size: 16))
                            .foregroundColor(Color.black)
                            .padding(.top, 1)
                    }
                    .padding(.leading, 12)
                    
                    VStack(alignment: .center){
                        AsyncImage(url: URL(string: "\(offer.image)")) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(5)
                                    .padding(10)
                                    .id(1)
                            } else if phase.error != nil {
                                Text("Something went wrong with this image")
                                    .font(.system(size: 14))
                                    .frame(maxWidth: .infinity, alignment: .center)
                                
                            } else {
                                LoadingView()
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                        }
                        
                        Text("\(offer.description ?? "No description found")")
                            .font(.system(size: 16))
                            .foregroundColor(Color.black)
                        
                        QRGeneratorView(uuid:offer.id)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.bottom, 5)
                    }
                    .padding(8)
                }
            }.id(1)
            .padding(10)
    }
}


struct RestaurantCardContent: View {
    var restaurant: Restaurant
    @State private var showingAlert = false
    
    var body: some View{
        
        RoundedRectangle(cornerRadius: 15)
            .fill(Color.white)
            .frame(width: .infinity, height: 300)
            .shadow(color: Color.gray, radius: 3, x: 0, y: 2)
            .overlay(alignment: .bottom) {
                
                VStack(alignment: .leading) {
                    HStack(alignment: .center){
                        Text("\(restaurant.name)")
                            .font(.system(size: 22))
                            .foregroundColor(.black)
                            .padding(10)
                            .bold()
                            .id(0)
                        
                        Image(systemName: "info.circle")
                            .imageScale(.large)
                            .foregroundColor(.blue)
                    }
                    VStack (alignment: .center){
                        AsyncImage(url: URL(string: "\(restaurant.picture)")) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(10)
                                    .padding([.bottom,.leading,.trailing],15)
                                    .id(1)
                                
                            } else if phase.error != nil {
                                Text("Something went wrong with this image")
                            } else {
                                LoadingView()
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                        }
                        Button("Open table"){
                            showingAlert = true
                        }
                        .buttonStyle(SmallButtonStyle(color: Color("MainYellow")))
                        .alert(isPresented: $showingAlert){
                            Alert(title: Text("Ups! Has sido mas rápido que nosotros"), message: Text("Funcionalidad en desarrollo"), dismissButton:.default(Text("Got it!")))
                        }
                    }
                }
            }.id(3)
            .padding(10)
    }
    
}

struct OfferDetailCardView_Previews: PreviewProvider {
    static var previews: some View {
        OfferDetailCardView(
            offer: Offer(
                id: UUID(),
                title: "All you can eat Sushi!",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ornare leo lacus, vel dictum lacus viverra nec.",
                image: "https://media.glamour.es/photos/616f6ddd16c8b9c6f6317eaf/master/w_1600%2Cc_limit/742412.jpg",
                startHour: Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date(),
                endHour: Calendar.current.date(byAdding: .hour, value: 3, to: Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()) ?? Date()),
            restaurant: Restaurant(
                id: UUID(),
                name: "Sushi Restaurant",
                type: "Chino",
                picture:"https://media.glamour.es/photos/616f6ddd16c8b9c6f6317eaf/master/w_1600%2Cc_limit/742412.jpg")
        )
    }
}
struct RestaurantCardContent_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantCardContent(restaurant: Restaurant(
            id: UUID(),
            name: "Sushi Restaurant",
            type: "Chino",
            picture: "https://media.glamour.es/photos/616f6ddd16c8b9c6f6317eaf/master/w_1600%2Cc_limit/742412.jpg"))
    }
}

struct OfferCardContent_Previews: PreviewProvider {
    static var previews: some View {
        OfferCardContent(
            offer: Offer(
                id: UUID(),
                title: "Primera Oferta",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ornare leo lacus, vel dictum lacus viverra nec. Morbi a lorem lacinia dui eleifend imperdiet. Curabitur dictum tortor non nibh pharetra, eget congue nunc scelerisque. Aenean vel efficitur nulla, eget scelerisque libero. Phasellus velit mi, maximus ut euismod sed, eleifend non elit. Aliquam augue odio, dictum a purus a, semper blandit mi. Proin ac convallis neque. Vestibulum sed mauris at magna suscipit malesuada eget ut enim. Integer id cursus eros. Suspendisse maximus mattis ex, et blandit ipsum imperdiet ac. Morbi rhoncus, diam a porttitor ullamcorper, nisi turpis dapibus nunc, et eleifend libero mauris sed dui. Suspendisse potenti. Vestibulum molestie nec diam sit amet bibendum. Sed non convallis felis. Proin ullamcorper bibendum lorem, eu pulvinar risus lobortis at. Etiam sollicitudin ligula erat.",
                image: "https://media.glamour.es/photos/616f6ddd16c8b9c6f6317eaf/master/w_1600%2Cc_limit/742412.jpg",
                startHour: Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date(),
                endHour: Calendar.current.date(byAdding: .hour, value: 3, to: Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()) ?? Date()),
            restaurant: Restaurant(
                id: UUID(),
                name: "Sushi Restaurant",
                type: "Chino",
                picture:"https://media.glamour.es/photos/616f6ddd16c8b9c6f6317eaf/master/w_1600%2Cc_limit/742412.jpg"))
    }
}
