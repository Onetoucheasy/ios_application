//
//  LoginFormView.swift
//  RestauranteOfertas
//
//  Created by Enrique Poyato Ortiz on 3/8/23.
//

import SwiftUI
//
//struct LoginFormView: View {
//    
//    // MARK: - Properties
//    @EnvironmentObject private var rootViewModel: LoginViewModel
//    @EnvironmentObject private var viewRouter: ViewRouter
//    @State private var email = ""
//    @State private var password = ""
//    @State private var showLogin = ""
//    @FocusState private var textFieldEmailFocused: Bool
//    @FocusState private var textFieldPasswordFocused: Bool
//
//    // Main: - Main
//    var body: some View {
//        
//        VStack(spacing: 30) { // main form
//            VStack(spacing: 5) {
//                CustomTitle{
//                    Text("login")
//                }
//                CustomSubtitle{
//                    Text("login_acces_account")
//                }
//            } // Title end
//            VStack(spacing: 30) { // email & password text fields
//                
//                CustomTextField(textField: TextField("login_email_placeholder", text: $email), iconName: .Message)
//                CustomSecureField(secureTextField: SecureField("login_password_placeholder", text: $password), leadingIconName: .Padlock, trailingIconName: .Visible)
//            }
//            
//            VStack(spacing: 10) { // login button
//                Button {
//                    Task{
//                        //viewRouter.screen = .loading //TODO: The login is too fast that is hard to notice.
//                        do{
//                            try await rootViewModel.signIn(email: email, password: password)
//                         
//                            if rootViewModel.isCompany {
//                                viewRouter.tabCompany = .home
//                            }else{
//                                viewRouter.tabCustomer = .home
//                            }
//                            viewRouter.screen = .tabs
//                        }catch{
//                            print(error)
//                            print("Authentication failed. Check user and password")
//                         //   viewRouter.screen = .signIn //TODO: it does not save the texbox data.
//                        }
//                    }
//                } label: {
//                    Text("login")
//                        .font(.title2)
//                }
//                .buttonStyle(MainButtonStyle(color: Color("MainYellow")))
//            } // // login button end
//
//            
//            Button {
//                viewRouter.screen = .signUp
//            } label: {
//                Text("Create account")
//                    .font(.title2)
//            }
//            .buttonStyle(TransparentButtonStyle(color: Color("Transparent")))
//        } // main form end
//        .frame(maxHeight: .infinity, alignment: .top)
//    } // end var body
//}
//
//struct LoginFormView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginFormView()
//    }
//}
