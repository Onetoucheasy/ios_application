//
//  LoadingView.swift
//  RestauranteOfertas
//
//  Created by Alberto Junquera Ramírez on 11/8/23.
//

import SwiftUI
//TODO: Test LoadingView
//TODO: Add loading view in all the views that need a loading view.
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
