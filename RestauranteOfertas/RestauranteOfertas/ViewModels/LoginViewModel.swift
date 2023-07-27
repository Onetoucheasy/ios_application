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
//        UserDefaults.standard.set(tokens.accessToken, forKey: URLs.accessToken)
//        UserDefaults.standard.set(tokens.refreshToken, forKey: URLs.refreshToken)
        
    }
    
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
