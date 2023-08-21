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
//
//    @MainActor func testWhenAllTheFormFieldsAreFilledAndValidThensignUpFormIsComplete() throws{
//        //SUT: When all the form fields are filled and valid in the customers form, the propperty signUpFormIsComplete is set to true, which enables the register button in the SignUpView.
//        
//        //Given:
//        let signUpVM = SignUpViewModel(testing: true, userTypeForm: .Customer)
//        //Then:
//        XCTAssertTrue(signUpVM.signUpFormIsComplete)
//    }
//    
//    @MainActor func testWhenAllTheFormFieldsAreFilledAndPasswordMissmatchThensignUpFormIsNotComplete() throws{
//        //SUT: When all the form fields are filled but the password missmatch in the customers form, the propperty signUpFormIsComplete is set to false, which disables the register button in the SignUpView.
//        
//        //Given:
//        let signUpVM = SignUpViewModel(testing: true, userTypeForm: .Customer)
//        
//        //When:
//        signUpVM.passwordValidator = "TestPAss"
//        
//        //Then:
//        XCTAssertFalse(signUpVM.signUpFormIsComplete)
//    }
//    
//    @MainActor func testWhenAllTheFormFieldsAreFilledAndEmailIsInvalidThensignUpFormIsNotComplete() throws{
//        //SUT: When all the form fields are filled but the email is not valid in the customers form, the propperty signUpFormIsComplete is set to false, which disables the register button in the SignUpView.
//        
//        //Given:
//        let signUpVM = SignUpViewModel(testing: true, userTypeForm: .Customer)
//        
//        //When:
//        signUpVM.email = "InvalidEmail" //A valid email would be "valid@email.com"
//        
//        //Then:
//        XCTAssertFalse(signUpVM.signUpFormIsComplete)
//    }
//    
//    @MainActor func testWhenAllTheFormFieldsAreValidThenPerformSignUp() async throws{
//        //SUT: When all the form fields are filled but the email is not valid in the customers form, the propperty signUpFormIsComplete is set to false, which disables the register button in the SignUpView.
//        
//        //Given:
//        var suscriptor = Set<AnyCancellable>() //Import Combine to get AnyCancellable
//        let expectation = self.expectation(description: "Fake Tokens")
//        
//        let signUpVM = SignUpViewModel(testing: true, userTypeForm: .Customer, interactor: JWTInteractorTesting())
//        
//
//        //When:
//       // try await signUpVM.signUp()
//        
//        
//        //Then:
//        
//    }

}
//
//extension SignUpViewModel{
//    //MARK: - Testing Init -
//    convenience init(testing: Bool = false, userTypeForm: UserType){
//        if testing {
//            loadFilledSignUpForm()
//        }
//    }
//    
//    //MARK: - SignUpViewModel Testing Data
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
//    
//}
