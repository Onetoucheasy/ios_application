//
//  SignUpViewModel.swift
//  RestauranteOfertas
//
//  Created by Alberto Junquera Ramírez on 17/8/23.
//

import SwiftUI
import JWTDecode
@MainActor
class SignUpViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var isLoading = false
    @Published var isValidSession = false
    @Published var status = Status.none
    @Published var userTypeForm : UserType = .Customer
    @Published var userType: UserType = .Customer //TODO: Fix
    var showAlert = false
    
    //Common fields
    @Published var email = ""
    @Published var password = ""
    @Published var passwordValidator = ""
    //Company fields
    @Published var name = ""
    @Published var surname = ""
    @Published var phone = ""
    
    
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
        print("Decoded access JWT: \(String(describing: jwt["isCompany"].string))") //TODO: Check how is set in the backend.
        
        if jwt["isCompany"].string == "true" {userType = .Company} //TODO: FIX
        
        //TODO: Save tokens in KeyChain?
    }
    
    func signUp() async throws {
        let name = "NoName" //TODO: Fix
        isLoading = true
        defer { isLoading = false }
        
        if signUpFormIsComplete{
            let tokens = try await AuthEndpoint
                .signUp(name: name, email: email, password: password, userType: userTypeForm.rawValue)
                .request(type: SessionToken.self)
        }
        //TODO: Store in Keychain?
    }
    
    //MARK: - Validators -
    var signUpFormIsComplete: Bool{
        if !isInvalidEmailFormat && !isInvalidPasswordFormat && !isInvalidPasswordValidatorFormat && !isInvalidPasswordValidation{
            if userTypeForm == .Company{
                if !isInvalidNameFormat && !isInvalidSurnameFormat && !isInvalidPhoneFormat{
                    return true
                }
                return false
            }else{
                return true
            }
        }
        return false
    }
    var isInvalidEmailFormat: Bool{
        let emailValidator = NSPredicate(format: "SELF MATCHES %@", "(\\w+?@\\w+?\\x2E.+)")
        return !emailValidator.evaluate(with: email)
    }
    var isInvalidPasswordFormat: Bool {
        //TODO: Add RegEx to enforce stronger passwords?
        checkPasswordField(password: password)
    }
    
    var isInvalidPasswordValidatorFormat: Bool{
        checkPasswordField(password: passwordValidator)
    }
    var isInvalidPasswordValidation: Bool{
        password.elementsEqual(passwordValidator) ? false : true
    }
    
    func checkPasswordField(password: String) -> Bool{
        password.count >= 6 ? false : true
        
    }
    
    var isInvalidNameFormat: Bool{
        name.count != 0 ? false : true
    }
    var isInvalidSurnameFormat: Bool{
        surname.count != 0 ? false : true
    }
    var isInvalidPhoneFormat: Bool{
        phone.count != 0 ? false : true//TODO: Add phone RegEx?
    }
    
}
