//
//  LoginViewModel.swift
//  RestauranteOfertas
//
//  Created by Eric Olsson on 7/26/23.
//

import SwiftUI
import JWTDecode
@MainActor
class LoginViewModel: ObservableObject, SignInProtocol {
    
    // MARK: - Properties
    @Published var isLoading = false
    @Published var isValidSession = false
    @Published var userType: UserType = .Customer
    @Published var status = Status.none
    @Published var email = ""
    @Published var password = ""
    @Published var emailSignup = ""
    @Published var passwordSignUp = ""
    @Published var passwordValidator = ""
    @Published var name = ""
    @Published var surname = ""
    @Published var phone = ""
    @Published var userTypeForm: UserType = .Customer //TODO: Fix
    var showAlert = false //Publised? It seems to work without being published
    
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
        print("Decoded access JWT: \(String(describing: jwt["userType"].string))")
        
        guard let userTypeJwt = jwt.claim(name: "userType").string else {
           return
        }
                
        switch userTypeJwt {
        case "customer":
            userType = .Customer
        case "company":
            userType = .Company
        case "admin":
            userType = .Admin
        default:
            userType = .Customer
        }
        
        //TODO: Save tokens in KeyChain
        UserDefaults.standard.set(jwt.string, forKey: URLs.accessToken)
    }
    
    //MARK: - Validators -
    //SignIn
    var signInFormIsComplete: Bool{
        if !isInvalidEmailFormat && !isInvalidPasswordFormat{
            return true
        }
        return false
    }
    var isInvalidEmailFormat: Bool{
        let emailValidator = NSPredicate(format: "SELF MATCHES %@", "(\\w+?@\\w+?\\x2E.+)")
        return !emailValidator.evaluate(with: email)
    }
    //SignIn & SignUp
    var isInvalidPasswordFormat: Bool {
        //TODO: Add RegEx to enforce stronger passwords?
        password.count >= 6 ? false : true
    }
    
    //SignUp
    func passwordChecker() -> Bool{
        passwordSignUp.elementsEqual(passwordValidator)
    }
    
}

protocol SignInProtocol {
    
    func signIn(email: String, password: String) async throws
    
}
