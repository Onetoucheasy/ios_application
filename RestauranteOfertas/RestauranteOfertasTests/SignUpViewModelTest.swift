//
//  SignUpViewModelTest.swift
//  RestauranteOfertasTests
//
//  Created by Alberto Junquera Ramírez on 21/8/23.
//

import XCTest
import Combine

final class SignUpViewModelTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor func testWhenAllTheFormFieldsAreFilledAndValidThensignUpFormIsComplete() throws{
       //SUT: When all the form fields are filled and valid in the customers form, the propperty signUpFormIsComplete is set to true, which enables the register button in the SignUpView.
        
      //Given:
        let signUpVM = SignUpViewModelForTest(userTypeForm: .Customer, formIsFill: true)
        XCTAssertNotNil(signUpVM)
      //Then:
        XCTAssertTrue(signUpVM.signUpFormIsComplete)
    }
    
    @MainActor func testWhenAllTheFormFieldsAreFilledAndPasswordMissmatchThensignUpFormIsNotComplete() throws{
        //SUT: When all the form fields are filled but the password missmatch in the customers form, the propperty signUpFormIsComplete is set to false, which disables the register button in the SignUpView.
        
        //Given:
        let signUpVM = SignUpViewModelForTest(userTypeForm: .Customer)
        
       //When:
        signUpVM.passwordValidator = "12"
        XCTAssertNotNil(signUpVM)
        //Then:
        XCTAssertFalse(signUpVM.signUpFormIsComplete)
    }
    
    @MainActor func testWhenAllTheFormFieldsAreFilledAndEmailIsInvalidThensignUpFormIsNotComplete() throws{
        //SUT: When all the form fields are filled but the email is not valid in the customers form, the propperty signUpFormIsComplete is set to false, which disables the register button in the SignUpView.
        
        //Given:
        let signUpVM = SignUpViewModelForTest(userTypeForm: .Customer)
        XCTAssertNotNil(signUpVM)
        //When:
        signUpVM.email = "InvalidEmail" //A valid email would be "valid@email.com"
       
        //Then:
        XCTAssertFalse(signUpVM.signUpFormIsComplete)
    }
    
    @MainActor func testWhenFormFieldAreFilledAndValidThenPerformSignUp() async throws{
        
        //SUT: When all the form fields are filled and valid in the customers form, the propperty signUpFormIsComplete is set to true and the signUp would return a token
        
        //Given:
        let signUpVM = SignUpViewModelForTest(userTypeForm: .Customer, formIsFill: true)
        XCTAssertNotNil(signUpVM)
        //When:
        try await signUpVM.signUp()
            
        //Then:
        
        XCTAssertNotNil(signUpVM.token)
    }
    
    @MainActor func testWhenCompanyFormVariablesHaveValuesThenValidatorsWork() async throws{

           //SUT: When all the form fields are filled and valid in the company form, the propperty signUpFormIsComplete is set to true and the signUp would return a token
           
           //Given:
           let signUpVM = SignUpViewModel()
           XCTAssertNotNil(signUpVM)
           
           //When:
           signUpVM.userTypeForm = .Company
           
           signUpVM.name = "Test"
           signUpVM.surname = "Unit"
           signUpVM.phone = "111111111"
           signUpVM.email = "test@unitario.com"
           signUpVM.password = "123456"
           signUpVM.passwordValidator = "123456"
           
           //Then:
           
           XCTAssertFalse(signUpVM.isInvalidNameFormat)
           XCTAssertFalse(signUpVM.isInvalidSurnameFormat)
           XCTAssertFalse(signUpVM.isInvalidPhoneFormat)
           XCTAssertFalse(signUpVM.isInvalidEmailFormat)
           XCTAssertFalse(signUpVM.isInvalidPasswordFormat)
           XCTAssertFalse(signUpVM.isInvalidPasswordValidatorFormat)
           
           XCTAssertFalse(signUpVM.isInvalidPasswordValidation)
           XCTAssertTrue(signUpVM.signUpFormIsComplete)
       }
       
       @MainActor func testWhenCompanyFormVariablesHaveInvalidValuesThenValidatorsWork() async throws{
           
           //SUT: When all the form fields are filled and invalid in the company form, the propperty signUpFormIsComplete is set to false.
           
           //Given:
           let signUpVM = SignUpViewModel()
           XCTAssertNotNil(signUpVM)
           
           //When:
           signUpVM.userTypeForm = .Company
           
           signUpVM.name = ""
           signUpVM.surname = ""
           signUpVM.phone = ""
           signUpVM.email = "testunitarioemail"
           signUpVM.password = "12345"
           signUpVM.passwordValidator = "4658"
           
           //Then:
           
           XCTAssertTrue(signUpVM.isInvalidNameFormat)
           XCTAssertTrue(signUpVM.isInvalidSurnameFormat)
           XCTAssertTrue(signUpVM.isInvalidPhoneFormat)
           XCTAssertTrue(signUpVM.isInvalidEmailFormat)
           XCTAssertTrue(signUpVM.isInvalidPasswordFormat)
           XCTAssertTrue(signUpVM.isInvalidPasswordValidatorFormat)
           
           XCTAssertTrue(signUpVM.isInvalidPasswordValidation)
           XCTAssertFalse(signUpVM.signUpFormIsComplete)
       }
       
       @MainActor func testWhenCustomerFormVariablesHaveValuesThenValidatorsWork() async throws{
           
           //SUT: When all the form fields are filled and valid in the customer form, the propperty signUpFormIsComplete is set to true and the signUp would return a token
           
           //Given:
           let signUpVM = SignUpViewModel()
           XCTAssertNotNil(signUpVM)
           
           //When:
           signUpVM.userTypeForm = .Customer
           
           signUpVM.name = "Test"
           signUpVM.email = "test@unitario.com"
           signUpVM.password = "123456"
           signUpVM.passwordValidator = "123456"
           
           //Then:
           
           XCTAssertFalse(signUpVM.isInvalidNameFormat)
           XCTAssertFalse(signUpVM.isInvalidEmailFormat)
           XCTAssertFalse(signUpVM.isInvalidPasswordFormat)
           XCTAssertFalse(signUpVM.isInvalidPasswordValidatorFormat)
           
           XCTAssertFalse(signUpVM.isInvalidPasswordValidation)
           XCTAssertTrue(signUpVM.signUpFormIsComplete)
       }
       
       @MainActor func testWhenCustomerFormVariablesHaveInvalidValuesThenValidatorsWork() async throws{
           
           //SUT: When all the form fields are filled and valid in the customer form, the propperty signUpFormIsComplete is set to true and the signUp would return a token
           
           //Given:
           let signUpVM = SignUpViewModel()
           XCTAssertNotNil(signUpVM)
           
           //When:
           signUpVM.userTypeForm = .Customer
           
           signUpVM.name = "Test"
           signUpVM.email = "test@unitario.com"
           signUpVM.password = "123456"
           signUpVM.passwordValidator = "123456"
           
           //Then:
           
           XCTAssertFalse(signUpVM.isInvalidNameFormat)
           XCTAssertFalse(signUpVM.isInvalidEmailFormat)
           XCTAssertFalse(signUpVM.isInvalidPasswordFormat)
           XCTAssertFalse(signUpVM.isInvalidPasswordValidatorFormat)
           
           XCTAssertFalse(signUpVM.isInvalidPasswordValidation)
           XCTAssertTrue(signUpVM.signUpFormIsComplete)
       }
       
       @MainActor func testWhenCompanyFormVariablesHaveInvalidSurnameOrPhoneThenValidatorsWork() async throws{
           
           //SUT: When all the form fields are filled valid but surname or phone, in the company form, the propperty signUpFormIsComplete is set to false.
           
           //Given:
           let signUpVM = SignUpViewModel()
           XCTAssertNotNil(signUpVM)
           
           //When:
           signUpVM.userTypeForm = .Company
           
           signUpVM.name = "Test"
           signUpVM.surname = ""
           signUpVM.phone = ""
           signUpVM.email = "testunitario@email.com"
           signUpVM.password = "123456"
           signUpVM.passwordValidator = "123456"

           //Then:
           XCTAssertFalse(signUpVM.signUpFormIsComplete)
       }
}
