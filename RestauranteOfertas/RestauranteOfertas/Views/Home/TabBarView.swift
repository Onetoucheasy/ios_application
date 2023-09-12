//
//  HomeView.swift
//  RestauranteOfertas
//
//  Created by Enrique Poyato Ortiz on 4/8/23.
//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject var viewRouter: ViewRouter //TODO: Change ViewModel
    var body: some View {
        NavigationStack{
            TabView {
                HomeView()
                    .tabItem {
                        Image(.home)
                        Text("Inicio")
                    }
                Text("Estadísticas, working in progress!")
                    .tabItem {
                        Image(.char)
                        Text("Estadísticas")
                    }
                Text("Ajustes,working in progress!")
                    .tabItem {
                        Image(.settings)
                        Text("Ajustes")
                    }
            }
            .accentColor(.black)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView().environmentObject(ViewRouter())
    }
}
