//
//  CustomMainButton.swift
//  RestauranteOfertas
//
//  Created by Alberto Junquera Ramírez on 14/8/23.
//

import SwiftUI

struct MainButtonStyle : ButtonStyle{
    
    var color: Color
    
    func makeBody(configuration: Self.Configuration) -> some View{
        configuration.label
            .frame(width: 275, height: 45)
            .background(color)
            .cornerRadius(10)
            .foregroundColor(.black)
            .padding(.bottom, 5)
            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 3)
    }
}
