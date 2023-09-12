//
//  ChangeUserTyeButtonStyle.swift
//  RestauranteOfertas
//
//  Created by Alberto Junquera Ramírez on 16/8/23.
//

import SwiftUI

struct ChangeUserTypeButtonStyle : ButtonStyle{
    
    var color: Color
    
    func makeBody(configuration: Self.Configuration) -> some View{
        configuration.label
            .accentColor(.black)
            .frame( maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            .padding(.vertical, 10)
            .padding(.horizontal)
    }
}
