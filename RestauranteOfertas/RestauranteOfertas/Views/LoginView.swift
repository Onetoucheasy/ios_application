//
//  LoginView.swift
//  RestauranteOfertas
//
//  Created by Eric Olsson on 7/25/23.
//

// ⚠️ Nota: Hay varios comentarios y sombras temporales para ayudar a identificar bloques de código. Los eliminaré en próximos commits.

import SwiftUI

struct LoginView: View {
    var body: some View {
            ZStack {
                Image(decorative: "loginBackground")
                    .resizable()
                    .scaledToFill()
                    .opacity(1)
                
                VStack{
                    Text("login_title")
                    .font(Font.custom("Inder", size: 32))
                    .foregroundColor(.black)
                    .frame(width: 246, height: 36, alignment: .topLeading)
                    .padding([.top, .bottom], 120)
                  
                    Spacer()
                    VStack {
                        LoginForm()
                            .frame(maxHeight: .infinity, alignment: .top)
                            .environmentObject(LoginViewModel())
                    }
                    .padding([.leading, .trailing], 30)
                    Spacer()
                }
            }
            .ignoresSafeArea()
        }
}

struct Header: View {

    var body: some View {
       VStack(spacing: 10) {
            Image(.loginFoodImage)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 350, maxHeight: .infinity) //, alignment: .top)
                .padding(.top, 10)
            Image(.onetoucheasy)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 100, maxHeight: .infinity) //, alignment: .top)
                .padding(.top, 30)
            
        }
        .padding(.top, 30)

//        .background(Color(.systemGray2)) // color for testing
    }
}

private struct LoginForm: View {
    
    // MARK: - Properties
    @EnvironmentObject private var loginViewModel: LoginViewModel // remove?
    @EnvironmentObject private var viewRouter: ViewRouter
    @State private var email = ""
    @State private var password = ""
    @State private var showLogin = ""
    
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
                    Image(.envelopeCircleFill)
                        .font(.system(size: 38))
                        .foregroundColor(Color(.systemGray2))
                        .padding(2)
                    
                    TextField("login_email_placeholder", text: $email)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .padding(5)
                        .frame(minHeight: 50)
                }
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.systemGray5))
                )
                
                HStack(spacing: 5) { // password text field
                    
                    Image(.lockCircleFill)
                        .font(.system(size: 38))
                        .foregroundColor(Color(.systemGray2))
                        .padding(2)
                    
                    SecureField("login_password_placeholder", text: $password)
                        .textContentType(.password)
                        .textInputAutocapitalization(.never)
                        .padding(5)
                        .frame(minHeight: 50)
                } // password text field end
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.systemGray5))
                ) // password text field end
                
            }
            .padding(30)// email & password text fields
            
            VStack(spacing: 10) { // login button
                
                Button {
                    
                    Task {
                        
                        do {
                            try await loginViewModel.signIn(email: email, password: password)
                            viewRouter.screen = .tabs
                            
                        } catch {
                            
                            print(error)
                            print("Invalid user/pass")
                            
                        }
                    }
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


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
