//
//  SignUpView.swift
//  RestauranteOfertas
//
//  Created by Alberto Junquera Ramírez on 13/8/23.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var rootViewModel: LoginViewModel
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
        .ignoresSafeArea()    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView().environmentObject(LoginViewModel())
    }
}
