//
//  SignUpViewModelForTest.swift
//  RestauranteOfertasTests
//
//  Created by Camila Laura Lopez on 10/9/23.
//

import Foundation
import JWTDecode
import Combine

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
    
    //TODO change it for a async method
    var token: String?
    
    //MARK: - Testing Init -
    init(userTypeForm: UserType, formIsFill: Bool = false){
        
        self.jwtInteractor = JWTInteractorTesting()
        self.userType = userTypeForm
        
        if(formIsFill){
            loadFilledSignUpForm()
        }else{
            loadFailedSignUpForm()
        }
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
    
    func signUp() async throws {
        
        isLoading = true
        defer { isLoading = false }
        
        if signUpFormIsComplete{
            let token = self.jwtInteractor.getJWTTokens(userType: self.userType)
            
            self.token = try decode(jwt: token.accessToken).string
        }else{
            //TODO Manage failed signUp
            self.token = nil
        }
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

    func loadFailedSignUpForm() {
        self.name = ""
        self.email = "testtest.com"
        self.password = "Test"
        self.passwordValidator = "TestPass"
        
        if userTypeForm == .Company {
            self.phone = "123456789"
            self.surname = "Super"
            self.userType = .Company
        }
    }
}
