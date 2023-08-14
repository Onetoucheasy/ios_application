//
//  CustomTitle.swift
//  RestauranteOfertas
//
//  Created by Alberto Junquera Ramírez on 14/8/23.
//

import SwiftUI

struct CustomTitle <Content:View> : View{
    var content : Content
    
    init(@ViewBuilder content: () -> Content){
        self.content = content()
    }
    
    var body: some View{
        content
            .font(.largeTitle)
            .foregroundColor(.black)
            .padding( .bottom, 130)
            .frame(maxWidth: .infinity)
    }
}
