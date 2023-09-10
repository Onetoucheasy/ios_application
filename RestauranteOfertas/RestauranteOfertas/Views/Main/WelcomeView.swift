//
//  HomeView.swift
//  RestauranteOfertas
//
//  Created by Enrique Poyato Ortiz on 3/8/23.
//

/*import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    var body: some View {
        ZStack{
            Image(.LoginBackground)
                .resizable()
                .opacity(1)
            
            VStack{
                Text("welcome_title")
                    .font(Font.custom("Inder", size: 32))
                    .foregroundColor(.black)
                    .padding(.vertical, 100)
                    .frame(maxWidth: .infinity)
                
                Spacer()
                Text("title")
                    .font(.title2)
                    .padding(.bottom, 100)
                
                Button {
                    withAnimation {
                        rootViewModel.status = .clients
                    }
                    
                } label: {
                    Text("access_clients")
                        .font(.title2)
                }
                .frame(width: 275, height: 45)
                .background(Color.white)
                .cornerRadius(10)
                .foregroundColor(.black)
                .padding(.bottom, 30)
                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 3)
                
                Button {
                    withAnimation {
                        rootViewModel.status = .professional
                    }
                    
                } label: {
                    Text("access_professional")
                        .font(.title2)
                }
                .frame(width: 275, height: 45)
                .background(Color(red: 0.98, green: 0.86, blue: 0.42))
                .cornerRadius(10)
                .foregroundColor(.black)
                .padding(.bottom, 30)
                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 3)
                
                Spacer()
            }
            .ignoresSafeArea()
        }
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView().environmentObject(RootViewModel())
    }
}
*/
