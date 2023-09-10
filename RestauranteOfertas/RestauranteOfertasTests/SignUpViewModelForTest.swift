//
//  SignUpViewModelForTest.swift
//  RestauranteOfertasTests
//
//  Created by Camila Laura Lopez on 10/9/23.
//

import Foundation
import JWTDecode

class SignUpViewModelForTest: SignUpProtocol {
    
    @Published var isLoading = false
    @Published var isValidSession = false
    @Published var status = Status.none
    @Published var userTypeForm : UserType = .Customer
    @Published var userType: UserType = .Customer
    var showAlert = false
    //Common fields
    @Published var email = ""
    @Published var password = ""
    @Published var passwordValidator = ""
    //Company fields
    @Published var name = ""
    @Published var surname = ""
    @Published var phone = ""
    var jwtInteractor : JWTInteractorTesting
    
    
    //MARK: - Testing Init -
    
    init(userTypeForm: UserType){
        self.jwtInteractor = JWTInteractorTesting()
        self.userType = userTypeForm
        loadFilledSignUpForm()
    }
 
     func signIn(email: String, password: String) async throws {
        
        isLoading = true
        defer { isLoading = false }
         
         let sessionToken = jwtInteractor.getJWTTokens(userType: self.userType)
        
        let accessToken = sessionToken
                         .map{$0.accessToken}
                         .first()
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
    
    func loadFilledSignUpForm() {
        self.name = "Test"
        self.email = "test@test.com"
        self.password = "TestPass"
        self.passwordValidator = "TestPass"
        
        if userTypeForm == .Company {
            self.phone = "123456789"
            self.surname = "Super"
            self.userType = .Company
        }
    }

}
