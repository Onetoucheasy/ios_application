//
//  ReviewContent.swift
//  RestauranteOfertas
//
//  Created by Camila Laura Lopez on 9/9/23.
//

import SwiftUI

struct ReviewContent: View {
    @State private var showingAlert = false
    
    var body: some View{
        RoundedRectangle(cornerRadius: 15)
            .fill(Color.white)
            .frame(width: .infinity, height: 170)
            .shadow(color: Color.gray, radius: 3, x: 0, y: 2)
            .overlay(alignment: .bottom) {
                
                VStack(alignment: .center) {
                    
                    Text("Reseñas")
                        .font(.system(size: 22))
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(
                            [.trailing, .leading], 10)
                        .padding(.bottom, 1)
                    
                    
                    HStack{
                        Text("So good!")
                            .font(.system(size: 18))
                            .foregroundColor(Color.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                            .fontWeight(.semibold)
                        
                        //TODO añadir recomendaciones a bbdd para poder quitar informacion harcodeada
                        RecommendationStarView(numberOfStars: 4)
                            .imageScale(.medium)
                            .padding(.trailing)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    VStack{
                        Text("Un detalle de la experiencia grandiosa en este restaurant.")
                            .font(.system(size: 16))
                            .foregroundColor(Color.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding([.leading,.trailing, .top], 10)
                    }
                    
                    Button("Deja tu reseña"){
                        showingAlert = true
                    }
                    .buttonStyle(SmallButtonStyle(color: Color("MainYellow")))
                    .alert(isPresented: $showingAlert){
                        Alert(title: Text("Ups! Has sido mas rápido que nosotros"), message: Text("Funcionalidad en desarrollo"), dismissButton:.default(Text("Got it!")))
                    }
                }
            }.id(2)
            .padding(10)
    }
}

struct ReviewContent_Previews: PreviewProvider {
    static var previews: some View {
        ReviewContent()
    }
}


struct RecommendationStarView: View {
    var numberOfStars: Int
    var maxStars: Int = 5
    
    var body: some View {
        HStack {
            ForEach(1...maxStars, id: \.self) { index in
                Image(systemName: index <= numberOfStars ? "star.fill" : "star")
                    .imageScale(.small)
                    .foregroundColor(index <= numberOfStars ? .yellow : .gray)
            }
        }
    }
}

struct RecommendationStarView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationStarView(numberOfStars: 4)
    }
}

