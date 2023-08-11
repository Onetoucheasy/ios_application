//
//  LoginFormView.swift
//  RestauranteOfertas
//
//  Created by Enrique Poyato Ortiz on 3/8/23.
//

import SwiftUI

struct LoginFormView: View {
    
    // MARK: - Properties
    @EnvironmentObject private var rootViewModel: LoginViewModel // remove?
  //  @EnvironmentObject private var rootViewModel: RootViewModel // remove?
    @EnvironmentObject private var viewRouter: ViewRouter
    @State private var email = ""
    @State private var password = ""
    @State private var showLogin = ""
    @FocusState private var textFieldEmailFocused: Bool
    @FocusState private var textFieldPasswordFocused: Bool

    
    // Main: - Main
    var body: some View {
        
        VStack(spacing: 30) { // main form
            
            VStack(spacing: 5) {
                
                Text("login")
                    .font(.largeTitle)
                
                Text("login_acces_account")
                    .font(.callout)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                
            } // Title end
            
            VStack(spacing: 30) { // email & password text fields
                
                HStack(spacing: 5) { // email text field
                    Image(.Message)
                        .padding(14)
                        
                    
                    TextField("", text: $email)
                        .focused($textFieldEmailFocused)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .frame(height: 50)
                        .font(.system(size: 18))
                        .overlay{
                            Text(email.isEmpty ? "login_email_placeholder" : "")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.system(size: 18))
                                .onTapGesture {
                                    textFieldEmailFocused.toggle()
                                }
                            

                        }
                }
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                )

                
                HStack(spacing: 5) { // password text field
                    
                    Image(.Padlock)
                        .padding(14)
                    
                    SecureField("", text: $password)
                        .focused($textFieldPasswordFocused)
                        .textContentType(.password)
                        .textInputAutocapitalization(.never)
                        .frame(minHeight: 50)
                        .overlay{
                            Text(password.isEmpty ? "login_password_placeholder" : "")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.system(size: 18))
                                .onTapGesture {
                                    textFieldPasswordFocused.toggle()
                                }

                        }
                }
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                )
            }
            
            
            VStack(spacing: 10) { // login button
                
                Button {
                    
                    Task{
                        do{
                            try await                     rootViewModel.signIn(email: email, password: password)
                            //TODO: Decode the JWT to extract the user type.
                            viewRouter.screen = .tabs
                        }catch{
                            print(error)
                            print("Authentication failed. Check user and password")
                        }
                    }
                    
                   // rootViewModel.login(user: email, password: password)
                } label: {
                    Text("login")
                        .font(.title2)
                    
                }
                .frame(width: 275, height: 45)
                .background(Color(red: 0.98, green: 0.86, blue: 0.42))
                .cornerRadius(10)
                .foregroundColor(.black)
                .padding(.bottom, 30)
                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 3)
            } // // login button end

         

        } // main form end
//        .background(Color(.systemGray)) // color for testing
        
    } // end var body
}

struct LoginFormView_Previews: PreviewProvider {
    static var previews: some View {
        LoginFormView()
    }
}
