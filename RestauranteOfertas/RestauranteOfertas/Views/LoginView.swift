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

        VStack(spacing: 50) {
            Header()
                .aspectRatio(1.5, contentMode: .fit)
            LoginForm()
                .frame(maxHeight: .infinity, alignment: .top)
        }
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
        .background(Color(.systemGray2)) // color for testing
    }
}

private struct LoginForm: View {
    
    // MARK: - Properties
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
                                
                    // email field
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
                    
                    TextField("login_password_placeholder", text: $password)
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
                        print("Hi")
                    }
                } label: {
                    
                    Text("login")
                        .font(.headline)
                }
                .buttonStyle(.bordered)
                .tint(Color(.yellow))
                .foregroundColor(.black)
                .padding(.bottom, 30)
            } // // login button end

        } // main form end
        .background(Color(.systemGray)) // color for testing
        
        
        
        
    } // end var body
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
