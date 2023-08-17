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
        print("Decoded access JWT: \(jwt["isCompany"].string)") //TODO: Check how is set in the backend.
        
        if jwt["isCompany"].string == "true" {isCompany = true} //TODO: FIX
        
        //TODO: Save tokens in KeyChain?
    }
    
    func signUp() async throws {
        let name = "NoName"
        isLoading = true
        defer { isLoading = false }
        
        if passwordChecker(){
            let tokens = try await AuthEndpoint
                .signUp(name: name, email: emailSignup, password: passwordSignUp, userType: userTypeForm.rawValue)
                .request(type: SessionToken.self)
        }
        //TODO: Store in Keychain?
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
