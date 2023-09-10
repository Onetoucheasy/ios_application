//
//  SingInViewModelTest.swift
//  RestauranteOfertasTests
//
//  Created by Camila Laura Lopez on 10/9/23.
//

import XCTest

final class LoginViewModelTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor func testWhenAllTheFormFieldsAreFilledAndValidThenLoginFormIsComplete() throws{
       //SUT: When all the form fields are filled and valid in the customers form, the propperty LoginFormIsComplete is set to true, which enables the register button in the LoginForm.
        
      //Given:
        let loginVM = LoginViewModelForTest()
        XCTAssertNotNil(loginVM)
      //When:
        loginVM.loadFilledSignInForm()
      //Then:
        XCTAssertTrue(loginVM.signInFormIsComplete)
        
    }
    
    @MainActor func testWhenAllTheFormFieldsAreFilledAndPasswordMissmatchThenLoginFormIsNotComplete() throws{
        //SUT: When all the form fields are filled but the password missmatch in the login form, the propperty signInFormIsComplete is set to false, which disables the login button in the LoginView.
        
        //Given:
        let loginVM = LoginViewModelForTest()
        XCTAssertNotNil(loginVM)
        
       //When:
        loginVM.passwordValidator = "12"

        //Then:
        XCTAssertFalse(loginVM.signInFormIsComplete)
    }
    
    @MainActor func testWhenAllTheFormFieldsAreFilledAndEmailIsInvalidThenLoginFormIsNotComplete() throws{
        //SUT: When all the form fields are filled but the email is not valid in the login form, the propperty signInFormIsComplete is set to false, which disables the register button in the LoginView.
        
        //Given:
        let loginVM = LoginViewModelForTest()
        XCTAssertNotNil(loginVM)
        //When:
        loginVM.email = "InvalidEmail" //A valid email would be "valid@email.com"
       
        //Then:
        XCTAssertFalse(loginVM.signInFormIsComplete)
    }
    
    @MainActor func testWhenFormFieldAreFilledAndValidThenPerformLogin() async throws{
        
        //SUT: When all the form fields are filled and valid in the login form, the propperty signInFormIsComplete is set to true and the Login would return a token
        
        //Given:
        let loginVM = LoginViewModelForTest()
        XCTAssertNotNil(loginVM)
        //When:
        loginVM.loadFilledSignInForm()
        try await loginVM.signIn(email: loginVM.email, password: loginVM.password)
            
        //Then:
        XCTAssertNotNil(loginVM.token)
    }
}
