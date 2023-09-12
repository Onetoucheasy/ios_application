//
//  SmallButtonStyle.swift
//  RestauranteOfertas
//
//  Created by Camila Laura Lopez on 9/9/23.
//

import SwiftUI

struct SmallButtonStyle: ButtonStyle{
        
        var color: Color
        
        func makeBody(configuration: Self.Configuration) -> some View{
            configuration.label
                .frame(width: 175, height: 40)
                .background(color)
                .cornerRadius(10)
                .foregroundColor(.black)
                .padding(.bottom, 10)
        }
}
