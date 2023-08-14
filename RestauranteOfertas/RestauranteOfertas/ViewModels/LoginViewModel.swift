//
//  LoginViewModel.swift
//  RestauranteOfertas
//
//  Created by Eric Olsson on 7/26/23.
//

import SwiftUI
import JWTDecode
@MainActor
class LoginViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var isLoading = false
    @Published var isValidSession = false
    @Published var isCompany = false
    @Published var status = Status.none

    // MARK: - Init
//    init(isCustommer: Bool = true) { // ????
//
//        if isCustommer {
//            // Login Cliente
//        }else{
//            // Login Profesional
//        }
//        //checkSession()
//
//    }
    // MARK: - Init
    init() {
        checkSession()
    }
    // MARK: - Custom
    private func checkSession() {
        
        #warning("Validate local session")
        isValidSession = false
        
    }
    
    func signIn(email: String, password: String) async throws {
        
        isLoading = true
        defer { isLoading = false }
        
        let tokens = try await AuthEndpoint
            .signIn(email: email, password: password)
            .request(type: SessionToken.self)
        
        print("Tokens: \(tokens)\n")
        let jwt = try decode(jwt: tokens.accessToken)
        print("Decoded access JWT: \(jwt["isCompany"].string)") //TODO: Check how is set in the backend.
        
        if jwt["isCompany"].string == "true" {isCompany = true}
        
        //TODO: Save tokens in KeyChain
//        UserDefaults.standard.set(tokens.accessToken, forKey: URLs.accessToken)
//        UserDefaults.standard.set(tokens.refreshToken, forKey: URLs.refreshToken)
        
    }
    
    func signUp(name: String = "NoName", email: String, password: String, passwordValidator: String) async throws {
        
        isLoading = true
        defer { isLoading = false }
        
        if passwordChecker(password: password, passwordValidator: passwordValidator){
            let tokens = try await AuthEndpoint
                .signUp(name: name, email: email, password: password, isCompany: "false")
                .request(type: SessionToken.self)
        }
        
        
        //TODO: Store in Keychain
       // UserDefaults.standard.set(tokens.accessToken, forKey: URLs.accessToken)
       // UserDefaults.standard.set(tokens.refreshToken, forKey: URLs.refreshToken)
        
    }
    
    func passwordChecker(password: String, passwordValidator: String) -> Bool{
        password.elementsEqual(passwordValidator)
    }
    
}
