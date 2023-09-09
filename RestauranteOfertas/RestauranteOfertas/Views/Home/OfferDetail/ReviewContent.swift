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
                    
                    HStack{
                        Text("Reseñas")
                            .font(.system(size: 18))
                            .foregroundColor(Color.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(
                                [.trailing, .leading, .top], 8)
                            .bold()
                    }
                    HStack{
                        Text("Opinion label")
                            .font(.system(size: 14))
                            .foregroundColor(Color.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding([.leading, .trailing],8)
                            .padding(.top, 6)
                            .bold()
                        Image(systemName: "star")
                            .imageScale(.small)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    VStack{
                        Text("Un detalle de la experiencia grandiosa en este restaurant.")
                            .font(.system(size: 16))
                            .foregroundColor(Color.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding([.leading,.trailing], 8)
                    }
                
                    Button("Deja tu reseña"){
                        showingAlert = true
                    }
                    .buttonStyle(SmallButtonStyle(color: Color("MainYellow")))
                    .alert(isPresented: $showingAlert){
                        Alert(title: Text("Ups! Has sido mas rápido que nosotros"), message: Text("Funcionalidad en desarrollo"), dismissButton:.default(Text("Got it!")))
                    }
                }
            }
            .padding(10)
    }
    
}

struct ReviewContent_Previews: PreviewProvider {
    static var previews: some View {
        ReviewContent()
    }
}


