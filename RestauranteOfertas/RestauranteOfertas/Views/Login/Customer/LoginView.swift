//
//  LoginView.swift
//  RestauranteOfertas
//
//  Created by Eric Olsson on 7/25/23.
//

// ⚠️ Nota: Hay varios comentarios y sombras temporales para ayudar a identificar bloques de código. Los eliminaré en próximos commits.

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    var body: some View {
        ZStack {
            Image("LoginBackground")
                .resizable()
                .opacity(1)
            
            VStack{
                Text("login_title")
                    .font(Font.custom("Inder", size: 32))
                    .foregroundColor(.black)
                    .padding([.top, .bottom], 120)
                    .frame(maxWidth: .infinity)
                
                Spacer()
                LoginFormView()
                    .frame(maxHeight: .infinity, alignment: .top)
                    .environmentObject(rootViewModel)
                
                    .padding([.leading, .trailing], 36)
                Spacer()
            }
            
            Button{
                withAnimation {
                    rootViewModel.status = .professional // Navegación a pantalla de acceso a profesionales
                }
            }label: {
                VStack(alignment: .leading){
                    HStack{
                        Text("Acceso ")
                            .font(.title3)
                        Image(.Crown)
                        Image(systemName: "arrow.right")
                            .font(.title3)
                    }
                    
                    HStack {
                        Text("Profesionales")
                            .font(.title3)
                        
                    }
                }
                
            }
            .accentColor(.black)
            .frame( maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            .padding(.vertical, 10)
            .padding(.horizontal)
            
            
        }
        .ignoresSafeArea()
    }
}

//struct Header: View {
//
//    var body: some View {
//       VStack(spacing: 10) {
//            Image(.loginFoodImage)
//                .resizable()
//                .scaledToFit()
//                .frame(maxWidth: 350, maxHeight: .infinity) //, alignment: .top)
//                .padding(.top, 10)
//            Image(.onetoucheasy)
//                .resizable()
//                .scaledToFit()
//                .frame(maxWidth: 100, maxHeight: .infinity) //, alignment: .top)
//                .padding(.top, 30)
//
//        }
//        .padding(.top, 30)
//
////        .background(Color(.systemGray2)) // color for testing
//    }
//}




struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(RootViewModel())
    }
}
