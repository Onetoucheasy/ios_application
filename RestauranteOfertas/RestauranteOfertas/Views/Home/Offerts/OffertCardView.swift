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
    var backgroundImage: Image // Agrega una propiedad para la imagen de fondo
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .frame(width: 341, height: 190)
                .shadow(color: Color.gray, radius: 5, x: 0, y: 2)
                .overlay(alignment: .bottom) {
                    
                    VStack(alignment: .leading) {
                        
                        HStack {
                            Text(offer.offerName ?? "")
                                .bold()
                            Spacer()
//                            Text((Offer.distance?.formatted() ?? "") + " m")
//                                .bold()

                        }
                        .padding(.bottom, 10)
                        
//                        Text("1600 a 1800")
                        Text(getFormattedTime(date: offer.startTime!) + " to " + getFormattedTime(date: offer.endTime!)) // TODO: remove "!"
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 95, alignment: .top)
                }
            backgroundImage // Utiliza la imagen de fondo como fondo del GeometryReader
                .overlay(alignment: .topTrailing) {
                    Image(systemName: "heart")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(8)
                }
                .overlay(alignment: .leading) {
                    HStack {
                        Image("Logo")
                        Text(restaurant.name)
                            .font(.title.bold())
                        .foregroundColor(.white)
                    }
                    .padding(.horizontal)
                }
                .offset(y: -50)
                .mask(
                    GeometryReader { geometry in
                        Path { path in
                            let width = geometry.size.width
                            let height = geometry.size.height*2
                            let radius: CGFloat = 15
                            path.move(to: CGPoint(x: radius, y: 0))
                            path.addLine(to: CGPoint(x: width - radius, y: 0))
                            path.addArc(center: CGPoint(x: width - radius, y: radius), radius: radius, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
                            path.addLine(to: CGPoint(x: width, y: height - radius))
                            path.addLine(to: CGPoint(x: 0, y: height - radius))
                            path.addLine(to: CGPoint(x: 0, y: radius))
                            path.addArc(center: CGPoint(x: radius, y: radius), radius: radius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 90), clockwise: false)
                        }
                    }
                        .offset(y: -50)
                )
        }
    }
    
    func getFormattedTime(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm" // Formato de hora (24 horas) y minutos
        
        let currentDate = date
        return dateFormatter.string(from: currentDate)
    }
}



struct OfferCardView_Previews: PreviewProvider {
    static var previews: some View {
        OfferCardView(
            offer:
                Offer(
                    id: UUID(uuidString: "aaccca5f-349c-494a-97a0-16d9f57e32ca")!,
                    offerName: "Pack Sorpresa",
                    description: "Doble el valor...",
                    image: "image.png",
                    distance: 2,
                    startTime: Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date(),
                    endTime: Calendar.current.date(byAdding: .hour, value: 3, to: Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()) ?? Date(),
                    postTime: Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date(),
                    favorite: false
                ),
            restaurant:
                Restaurant(
                    id: UUID(uuidString: "165eb19d-47a7-48b8-b354-4a44b9a707de")!,
                    name: "Tapas Bar",
                    type: "Espanol",
                    latitude: 40.123,
                    longitude: -4.123,
                    openingHour: Calendar.current.date(from: DateComponents(year: 2023, month: 9, day: 15, hour: 10, minute: 00, second: 0)),
                    closingHour: Calendar.current.date(from: DateComponents(year: 2023, month: 9, day: 15, hour: 23, minute: 59, second: 0))
                ),
            backgroundImage: Image("fondoRestaurant")
        ) // Reemplaza "yourImageNameHere" con el nombre de tu imagen
    }
}
