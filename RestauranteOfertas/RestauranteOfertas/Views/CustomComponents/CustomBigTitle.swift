//
//  CustomTitle.swift
//  RestauranteOfertas
//
//  Created by Alberto Junquera Ramírez on 14/8/23.
//

import SwiftUI

struct CustomBigTitle <Content:View> : View{
    var content : Content
    var paddingTop : CGFloat
    var paddingBottom : CGFloat
    init(paddingTop: CGFloat, paddingBottom: CGFloat, @ViewBuilder content: () -> Content){
        self.paddingTop = paddingTop
        self.paddingBottom = paddingBottom
        self.content = content()
    }
    
    var body: some View{
        content
//            .font(.largeTitle)
//            .foregroundColor(.black)
//            .padding( .bottom, 130)
//            .frame(maxWidth: .infinity)
            .font(Font.custom("Inder", size: 32))
            .foregroundColor(.black)
            .padding(EdgeInsets(top: paddingTop, leading: 0, bottom: paddingBottom, trailing: 0))
            .frame(maxWidth: .infinity)
    }
}
