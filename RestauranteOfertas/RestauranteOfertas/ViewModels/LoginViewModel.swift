//
//  LoginViewModel.swift
//  RestauranteOfertas
//
//  Created by Eric Olsson on 7/26/23.
//

import SwiftUI

@MainActor
class LoginViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var isLoading = false
    @Published var isValidSession = false
    @Published var isCompany = false
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
        
        //TODO: Save tokens in KeyChain
//        UserDefaults.standard.set(tokens.accessToken, forKey: URLs.accessToken)
//        UserDefaults.standard.set(tokens.refreshToken, forKey: URLs.refreshToken)
        
    }
    //TODO: SignUp
//    func signUp(name: String, email: String, password: String) async throws {
//        
//        isLoading = true
//        defer { isLoading = false }
//        
//        let tokens = try await AuthEndpoint
//            .signUp(name: name, email: email, password: password)
//            .request(type: SessionToken.self)
//        
//        UserDefaults.standard.set(tokens.accessToken, forKey: URLs.accessToken)
//        UserDefaults.standard.set(tokens.refreshToken, forKey: URLs.refreshToken)
//        
//    }
    
}
