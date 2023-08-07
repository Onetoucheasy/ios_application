//
//  HomeView.swift
//  RestauranteOfertas
//
//  Created by Enrique Poyato Ortiz on 4/8/23.
//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(.home)
                    Text("Inicio")
                }
            Color.red
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .tabItem {
                    Image(.char)
                    Text("Estadísticas")
                }
            Text("Ajustes")
                .tabItem {
                    Image(.settings)
                    Text("Ajustes")
                }
        }
        .accentColor(.black)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView().environmentObject(RootViewModel())
    }
}
