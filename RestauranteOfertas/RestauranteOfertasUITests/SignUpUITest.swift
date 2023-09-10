//
//  SignUpUITest.swift
//  RestauranteOfertasUITests
//
//  Created by Alberto Junquera Ramírez on 21/8/23.
//

import XCTest
import ViewInspector
import SwiftUI
import Combine
@testable import RestauranteOfertas

final class SignUpUITest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    //MainActor is needed due to the environmentObject
    @MainActor func testWhenCustomerSignUpWithValidTextFieldsRegistorButtonIsEnabled() throws {
        //SUT Customer signUp: When email, password and passwordValidatorm and password = passwordValidator, registerbutton is enabled.
        
        //GIVEN
        let signUpView = SignUpView()
            .environmentObject(SignUpViewModel())
            .environmentObject(ViewRouter())
       
        XCTAssertNotNil(signUpView)
      
        let emailField = try signUpView.inspect().find(viewWithId: 7)
        XCTAssertNotNil(emailField)
        let passwordField = try signUpView.inspect().find(viewWithId: 8)
        XCTAssertNotNil(passwordField)
        let passwordValidatorField = try signUpView.inspect().find(viewWithId: 9)
        XCTAssertNotNil(passwordValidatorField)
        
        let registerButton = try signUpView.inspect().find(viewWithId: 10)
        XCTAssertNotNil(passwordValidatorField)

        //WHEN
        
       
        //THEN
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
