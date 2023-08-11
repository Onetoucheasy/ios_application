//
//  LoadingView.swift
//  RestauranteOfertas
//
//  Created by Alberto Junquera Ramírez on 11/8/23.
//

import SwiftUI
//TODO: Test LoadingView
struct LoadingView: View {
    var body: some View{
        ProgressView(label: {
            Text("Loading") //TODO: Add Localization
                .id(0)
        })
        .progressViewStyle(CircularProgressViewStyle(tint: .yellow)) //TODO: add APP color
        .foregroundColor(.yellow)
        .id(1)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
