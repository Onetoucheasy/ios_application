//
//  HomeView.swift
//  RestauranteOfertas
//
//  Created by Enrique Poyato Ortiz on 3/8/23.
//

import SwiftUI

struct RootView: View {
    
    @StateObject private var loginViewModel = LoginViewModel()
    @StateObject private var signUpViewModel = SignUpViewModel()
    @StateObject private var viewRouter = ViewRouter()
    
    var body: some View {
        Group{
            switch viewRouter.screen{
            case .loading:
                LoadingView()
            case .signIn:
                LoginView()
            case .signUp:
                SignUpView()
            case .tabs:
                TabBarView()
            }
        }
        .environmentObject(loginViewModel)
        .environmentObject(viewRouter)
        .environmentObject(signUpViewModel)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView().environmentObject(ViewRouter())
    }
}
