//
//  LoginView.swift
//  RestauranteOfertas
//
//  Created by Eric Olsson on 7/25/23.
//

// ⚠️ Nota: Hay varios comentarios y sombras temporales para ayudar a identificar bloques de código. Los eliminaré en próximos commits.

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var loginViewModel: LoginViewModel
    @EnvironmentObject private var viewRouter: ViewRouter
    
    var body: some View {
        ZStack {
            Image("Login_Background")
                .resizable()
                .opacity(1)
                .id(1)
            VStack{
                //TODO FIX descuadre con logo en background image
                CustomBigTitle(paddingTop: 130, paddingBottom: 130, content: {
                    Text("") //App logo would fit better in here?
                }).id(2)
                Spacer()
                VStack(spacing: 30) { // main form
                    VStack(spacing: 5) {
                        CustomTitle{
                            Text("login").id(3)
                        }
                        CustomSubtitle{
                            Text("login_acces_account").id(4)
                        }
                    } // Title end
                    VStack(spacing: 30) { // email & password text fields
                        CustomTextField(text: $loginViewModel.email, fieldType: .emailAddress, leadingIcon: .Message, isFieldHasError: loginViewModel.isInvalidEmailFormat).id(5)
                        CustomTextField(text: $loginViewModel.password, fieldType: .password, leadingIcon: .Padlock, trailingIcon: .Visible, isSecureField: true, isFieldHasError: loginViewModel.isInvalidPasswordFormat).id(6)
                    }
                    
                    VStack(spacing: 10) { // login button
                        Button {
                            Task{
                                //viewRouter.screen = .loading
                                do{
                                    //                                    if rootViewModel.isLoading{
                                    //                                        viewRouter.screen = .loading
                                    //                                    }
                                    try await loginViewModel.signIn(email: loginViewModel.email, password: loginViewModel.password)
                                    
                                    switch loginViewModel.userType
                                    {
                                    case .Customer:
                                        viewRouter.tabCompany = .home
                                    case .Company:
                                        viewRouter.tabCustomer = .home
                                    case .Admin:
                                        viewRouter.tabCustomer = .home
                                    }
                                    viewRouter.screen = .tabs
                                }catch{
                                    print(error)
                                    print("Authentication failed. Check user and password")
                                    loginViewModel.showAlert = true
                                    //viewRouter.screen = .signIn //TODO: it does not save the texbox data.
                                }
                            }
                        } label: {
                            Text("login")
                                .font(.title2)
                        }
                        .disabled(!loginViewModel.signInFormIsComplete)
                        .buttonStyle(MainButtonStyle(color: Color("MainYellow")))
                        .alert(isPresented: $loginViewModel.showAlert) {
                            Alert(title: Text("login_alert_title"), message: Text("login_alert_message"), dismissButton: .default(Text("login_alert_ok")))
                        
                                
                        }.id(7)
                    } // // login button end
                    
                    Button {
                        viewRouter.screen = .signUp
                    } label: {
                        Text("login_no_account")
                            .font(.title2)
                    }
                    .buttonStyle(TransparentButtonStyle(color: Color("Transparent")))
                    .id(8)
                } // main form end
                .frame(maxHeight: .infinity, alignment: .top)
                
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(LoginViewModel())
    }
}
