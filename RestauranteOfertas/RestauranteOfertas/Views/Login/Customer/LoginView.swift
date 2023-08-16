//
//  LoginView.swift
//  RestauranteOfertas
//
//  Created by Eric Olsson on 7/25/23.
//

// ⚠️ Nota: Hay varios comentarios y sombras temporales para ayudar a identificar bloques de código. Los eliminaré en próximos commits.

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var rootViewModel: LoginViewModel
    @EnvironmentObject private var viewRouter: ViewRouter
   // @State private var email = ""
   // @State private var password = ""
   // @State var showAlert = false
    
    var body: some View {
        ZStack {
            Image("LoginBackground")
                .resizable()
                .opacity(1)
            VStack{
                CustomBigTitle(paddingTop: 130, paddingBottom: 130, content: {
                    Text("login_title") //App logo would fit better in here?
                })
                Spacer()
                VStack(spacing: 30) { // main form
                    VStack(spacing: 5) {
                        CustomTitle{
                            Text("login")
                        }
                        CustomSubtitle{
                            Text("login_acces_account")
                        }
                    } // Title end
                    VStack(spacing: 30) { // email & password text fields
                        
                        CustomTextField(textField: TextField("login_email_placeholder", text: $rootViewModel.email), iconName: .Message)
                        CustomSecureField(secureTextField: SecureField("login_password_placeholder", text: $rootViewModel.password), leadingIconName: .Padlock, trailingIconName: .Visible)
                    }
                    
                    VStack(spacing: 10) { // login button
                        Button {
                            Task{
                                //viewRouter.screen = .loading
                                do{
//                                    if rootViewModel.isLoading{
//                                        viewRouter.screen = .loading
//                                    }
                                    try await rootViewModel.signIn(email: rootViewModel.email, password: rootViewModel.password)
                                 
                                    if rootViewModel.isCompany {
                                        viewRouter.tabCompany = .home
                                    }else{
                                        viewRouter.tabCustomer = .home
                                    }
                                    viewRouter.screen = .tabs
                                }catch{
                                    print(error)
                                    print("Authentication failed. Check user and password")
                                    rootViewModel.showAlert = true
                                    //viewRouter.screen = .signIn //TODO: it does not save the texbox data.
                                }
                            }
                        } label: {
                            Text("login")
                                .font(.title2)
                        }
                        .buttonStyle(MainButtonStyle(color: Color("MainYellow")))
                        .alert(isPresented: $rootViewModel.showAlert) {
                            Alert(title: Text("login_alert_title"), message: Text("login_alert_message"), dismissButton: .default(Text("login_alert_ok")))
                        }
                    } // // login button end

                    Button {
                        viewRouter.screen = .signUp
                    } label: {
                        Text("login_no_account")
                            .font(.title2)
                    }
                    .buttonStyle(TransparentButtonStyle(color: Color("Transparent")))
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
