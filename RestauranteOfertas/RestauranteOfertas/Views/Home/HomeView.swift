//
//  HomeView.swift
//  RestauranteOfertas
//
//  Created by Enrique Poyato Ortiz on 4/8/23.
//

import SwiftUI

struct HomeView: View {
    @State var currentTab = 0
    @State var searchText = ""
    @State var isSearching: Bool = false
    var body: some View {
        VStack{
            HStack{
                if isSearching{
                    TextField("Buscar", text: $searchText)
                        .padding(.horizontal)
                        .frame(height: 30)
                        .background(RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.black, lineWidth: 1))
                }else{
                    Spacer()
               }
                
                Button{
                    withAnimation {
                        isSearching.toggle()
                    }
                }label: {
                    Image(.magnifyingglass)
                        .font(.system(size: 25))
                }
                .buttonStyle(.plain)
                
                Image(.Hamburger)

            }
            .padding(.horizontal)
            TabBarHome(currentTab: $currentTab)
            VStack {
                HStack{
                    FilterButtonComponent(action: {}, title: "Activo")
                    FilterButtonComponent(action: {}, title: "Ordenar")
                    FilterButtonComponent(action: {}, title: "Filtros")

                    
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                
            }
            TabView(selection: $currentTab) {
                ScrollView(.vertical, showsIndicators: false) {
                    OfferListView().tag(0)
                }
                Color.red.frame(maxWidth: .infinity, maxHeight: .infinity).tag(1)

                
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .onAppear{
                print("HomeView...\n")
            }
        }
    }
}

struct TabBarHome: View {
    @Binding var currentTab: Int
    @Namespace var namespace
    
    var tabBarOptions: [String] = ["Ofertas", "Restaurantes"]
    var body: some View{
        HStack {
            ForEach(Array(zip(self.tabBarOptions.indices, self.tabBarOptions)), id: \.0) { index, name in
                TabBarItem(currentTab: $currentTab, namespace: namespace.self, tabBarItemName: name, tab: index)
                    .frame(maxWidth: .infinity)
                
                
            }
        }
        .background(RoundedRectangle(cornerRadius: 20)
            //.fill(Color(hex: 0xFFF9E8)))
            .fill(Color("MainYellow")))
        .frame(height: 0)
        .padding(.top, 50)
        .padding(.horizontal)
    }
}

struct TabBarItem: View {
    @Binding var currentTab: Int
    let namespace: Namespace.ID
    
    var tabBarItemName: String
    var tab: Int
    
    var body: some View {
        Button{
            self.currentTab = tab
        }label: {
            VStack{
                Spacer()
                Text(tabBarItemName)
                if currentTab == tab {
                    //Color(hex: 0xFBDB6C)
                    Color("MainYellow")
                    
                        .frame(height: 4)
                        .matchedGeometryEffect(id: "underline", in: namespace, properties: .frame)
                        .padding(.horizontal)
                } else {
                    Color.clear
                        .frame(height: 2)
                }
            }
            .animation(.spring(), value: self.currentTab)
        }
        .buttonStyle(.plain)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
