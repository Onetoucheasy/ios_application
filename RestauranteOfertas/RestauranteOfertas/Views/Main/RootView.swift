//
//  HomeView.swift
//  RestauranteOfertas
//
//  Created by Enrique Poyato Ortiz on 3/8/23.
//

import SwiftUI

struct RootView: View {
   
    @StateObject private var loginViewModel = LoginViewModel()
    @StateObject private var viewRouter = ViewRouter()
    
    var body: some View {
        Group{
            switch viewRouter.screen{
            case .welcome:
                WelcomeView()
            case .loading:
                LoadingView()
            case .signIn:
                LoginView()
            case .signUp:
                SignUpView()
            case .tabs:
               // ContentView()
                TabBarView()
            }
        }
        .environmentObject(loginViewModel)
        .environmentObject(viewRouter)
        
    }
}
//struct RootView: View {
//    @EnvironmentObject var rootViewModel: RootViewModel
//    var body: some View {
//        switch rootViewModel.status {
//        case .none:
//            WelcomeView()
//        case .clients:
//            LoginView()
//        case .professional:
//            Text("Pantalla de login para profesionales")
//        case .notAccount:
//            Text("Pantalla de 'no tengo cuenta'")
//        case .registerClient:
//            Text("Pantalla de registro")
//        case .registerProfessional:
//            Text("Pantalla de regitro de un profesional")
//        case .login:
//            TabBarView()
//        case .loading:
//            LoadingView()
//        }
//    }
//}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView().environmentObject(RootViewModel())
    }
}
