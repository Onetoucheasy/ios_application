//
//  TransparentButtonStyle.swift
//  RestauranteOfertas
//
//  Created by Alberto Junquera Ramírez on 14/8/23.
//

import SwiftUI

struct TransparentButtonStyle : ButtonStyle{
    
    var color: Color
    
    func makeBody(configuration: Self.Configuration) -> some View{
        configuration.label
            .frame(width: 175, height: 40)
            .background(color)
            .cornerRadius(10)
            .foregroundColor(.black)
            .padding(.bottom, 30)
    }
}
