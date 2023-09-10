//
//  SignInViewModelForTest.swift
//  RestauranteOfertasTests
//
//  Created by Camila Laura Lopez on 10/9/23.
//

import SwiftUI
import JWTDecode


@MainActor
class LoginViewModelForTest: ObservableObject, SignInProtocol {
    
    // MARK: - Properties
    @Published var isLoading = false
    @Published var userType: UserType = .Customer
    @Published var status = Status.none
    @Published var email = ""
    @Published var password = ""
    @Published var passwordValidator = ""
    var showAlert = false //Publised? It seems to work without being published
    var jwtInteractor : JWTInteractorTesting

    var token: String?
    
    init() {
        self.jwtInteractor = JWTInteractorTesting()
        self.token = nil
    }
    
    func signIn(email: String, password: String) async throws {
        
        isLoading = true
        defer { isLoading = false }
        
        let token = self.jwtInteractor.getJWTTokens(userType: self.userType)
        
        let decodedAccessToken = try decode(jwt: token.accessToken)
        
        if let userTypeJwt = decodedAccessToken.claim(name: "userType").string {
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
        }
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
    
    func loadFilledSignInForm() {
       
        self.email = "test@test.com"
        self.password = "TestPass"
    }
}
