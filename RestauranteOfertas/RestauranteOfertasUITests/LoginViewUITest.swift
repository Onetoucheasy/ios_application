//
//  LoginViewTest.swift
//  RestauranteOfertasUITests
//
//  Created by Alberto Junquera Ramírez on 18/8/23.
//

import XCTest
import ViewInspector
import SwiftUI
import Combine
@testable import RestauranteOfertas

final class LoginViewUITest: XCTestCase {

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
    //@MainActor func whenEmailAndPasswordAreInvlaidLoginButtonIsDisabled() throws{
    func testWhenEmailAndPasswordAreInvlaidLoginButtonIsDisabled() throws{
        //SUT Loggin button is not enabled if the email and the password are not valid.
        
        //Given:
        let app = XCUIApplication()
        app.launch()

        let emailField = app.textFields["Correo Electrónico"]
        let passwordField = app.secureTextFields["Contraseña"]
        let loginButton = app.buttons["Inicia sesión"]

        //WHEN
        emailField.tap()
        emailField.typeText("correo")
        
        passwordField.tap()
        passwordField.typeText("testPassword")
        
        //Then
        let isLoginButtonEnabled = loginButton.isEnabled
        XCTAssertFalse(isLoginButtonEnabled)
    }
    
    func testWhenEmailIsInvlaidLoginButtonIsDisabled() throws{
        //SUT Loggin button is not enabled if the email is not valid.
        
        //Given:
        let app = XCUIApplication()
        app.launch()

        let emailField = app.textFields["Correo Electrónico"]
        let passwordField = app.secureTextFields["Contraseña"]
        let loginButton = app.buttons["Inicia sesión"]

        //WHEN
        emailField.tap()
        emailField.typeText("correo")
        
        passwordField.tap()
        passwordField.typeText("testPassword")
        
        //Then
        let isLoginButtonEnabled = loginButton.isEnabled
        XCTAssertFalse(isLoginButtonEnabled)
    }
    
    func testWhenPasswordIsInvlaidLoginButtonIsDisabled() throws{
        //SUT Loggin button is not enabled if the password is not valid.
        
        //Given:
        let app = XCUIApplication()
        app.launch()

        let emailField = app.textFields["Correo Electrónico"]
        let passwordField = app.secureTextFields["Contraseña"]
        let loginButton = app.buttons["Inicia sesión"]

        //WHEN
        emailField.tap()
        emailField.typeText("test@test.com")
        
        passwordField.tap()
        passwordField.typeText("test")
        
        //Then
        let isLoginButtonEnabled = loginButton.isEnabled
        XCTAssertFalse(isLoginButtonEnabled)
    }
    
    func testWhenEmailAndPasswordAreValidLoginButtonIsEnabled() throws{
        //SUT Loggin button is enabled if the email and password are valid.
        
        //Given:
        let app = XCUIApplication()
        app.launch()

        let emailField = app.textFields["Correo Electrónico"]
        let passwordField = app.secureTextFields["Contraseña"]
        let loginButton = app.buttons["Inicia sesión"]

        //WHEN
        emailField.tap()
        emailField.typeText("test@test.com")
        
        passwordField.tap()
        passwordField.typeText("test123456")
        
        //Then
        let isLoginButtonEnabled = loginButton.isEnabled
        XCTAssertTrue(isLoginButtonEnabled)
    }
    
    func testWhenEmailAndPasswordAreValidButCredentialsAreInvalidAnAlertIsDisplayed() throws{
        //SUT: When the email and password are valid, and the login authentication fails, an alert is displayed.
        
        //GIVEN
        let app = XCUIApplication()
        app.launch()

        let emailField = app.textFields["Correo Electrónico"]
        let passwordField = app.secureTextFields["Contraseña"]
        let loginButton = app.buttons["Inicia sesión"]
        
        //WHEN
        emailField.tap()
        emailField.typeText("test@test.com")
        
        passwordField.tap()
        passwordField.typeText("test123456")
        
        loginButton.tap()
        
        let authFailed = app.alerts["Autenticación fallida"].isEnabled
       
        //THEN
        XCTAssertTrue(authFailed)
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
