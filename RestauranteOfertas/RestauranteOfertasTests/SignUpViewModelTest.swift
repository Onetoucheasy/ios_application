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
        //Then:
        XCTAssertTrue(signUpVM.signUpFormIsComplete)
    }
    
    @MainActor func testWhenAllTheFormFieldsAreFilledAndPasswordMissmatchThensignUpFormIsNotComplete() throws{
        //SUT: When all the form fields are filled but the password missmatch in the customers form, the propperty signUpFormIsComplete is set to false, which disables the register button in the SignUpView.
        
        //Given:
        let signUpVM = SignUpViewModelForTest(userTypeForm: .Customer)
        
       //When:
        signUpVM.passwordValidator = "12"
        
        //Then:
        XCTAssertFalse(signUpVM.signUpFormIsComplete)
    }
    
    @MainActor func testWhenAllTheFormFieldsAreFilledAndEmailIsInvalidThensignUpFormIsNotComplete() throws{
        //SUT: When all the form fields are filled but the email is not valid in the customers form, the propperty signUpFormIsComplete is set to false, which disables the register button in the SignUpView.
        
        //Given:
        let signUpVM = SignUpViewModelForTest(userTypeForm: .Customer)
        
        //When:
        signUpVM.email = "InvalidEmail" //A valid email would be "valid@email.com"
       
        //Then:
        XCTAssertFalse(signUpVM.signUpFormIsComplete)
    }
    
    @MainActor func testWhenFormFieldAreFilledAndValidThenPerformSignUp() async throws{
        
        //SUT: When all the form fields are filled and valid in the customers form, the propperty signUpFormIsComplete is set to true and the signUp would return a token
        
        //Given:
        let signUpVM = SignUpViewModelForTest(userTypeForm: .Customer, formIsFill: true)
        
        //When:
        try await signUpVM.signUp()
            
        //Then:
        
        XCTAssertNotNil(signUpVM.token)
    }
}
