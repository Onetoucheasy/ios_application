//
//  CustomSubtitle.swift
//  RestauranteOfertas
//
//  Created by Alberto Junquera Ramírez on 15/8/23.
//

import SwiftUI

struct CustomSubtitle <Content:View> : View{
    var content : Content
    
    init(@ViewBuilder content: () -> Content){
        self.content = content()
    }
    
    var body: some View{
        content
            .font(.callout)
            .foregroundColor(.black)
            .multilineTextAlignment(.center)
    }
}

