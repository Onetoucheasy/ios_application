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
    
    //Testing:
   // var interactor: JWTInteractorProtocol
    
    // MARK: - Init
    init() {
        checkSession()
    }
    
    //MARK: - Testing Init -
//    init(testing: Bool = false, userTypeForm: UserType){
//        if testing {
//            self.loadFilledSignUpForm()
//        }
//    }
//    init(testing: Bool = false, userTypeForm: UserType, interactor: JWTInteractorProtocol = JWTInteractorTesting()){
//        if testing {
//            self.loadFilledSignUpForm()
//        }
//    }
    
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
    
    func signUp() async throws {
        
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
        if !isInvalidNameFormat && !isInvalidEmailFormat && !isInvalidPasswordFormat && !isInvalidPasswordValidatorFormat && !isInvalidPasswordValidation{
            if userTypeForm == .Company{
                if !isInvalidSurnameFormat && !isInvalidPhoneFormat{
                    return true
                }
                return false
            }
                return true
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
    //MARK: - SignUpViewModel Testing Data
//    
//    func loadFilledSignUpForm() {
//        self.name = "Test"
//        self.email = "test@test.com"
//        self.password = "TestPass"
//        self.passwordValidator = "TestPass"
//        
//        if userTypeForm == .Company {
//            self.phone = "123456789"
//            self.surname = "Super"
//            self.userTypeForm = .Company
//            self.userType = .Company
//        }
//    }
}
