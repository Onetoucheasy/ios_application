//
//  CustomTextFieldTest.swift
//  RestauranteOfertasUITests
//
//  Created by Alberto Junquera Ramírez on 18/8/23.
//

import XCTest
import ViewInspector
import SwiftUI
import Combine
@testable import RestauranteOfertas

final class CustomTextFieldUITest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCustomTextFieldUIVariants() throws {
        // UI tests must launch the application that they test.
//        let app = XCUIApplication()
//        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        @State var testText: String = "123456"
        let view =  CustomTextField(text:  $testText, fieldType: .emailAddress  , leadingIcon: .Message )
        XCTAssertNotNil(view)
        
        //Number of subviews
        
        let subViews = try view.inspect().count
        XCTAssertEqual(subViews,1)
        
        let view2 = CustomTextField(text: $testText, fieldType: .password, leadingIcon: .Padlock, trailingIcon: .Visible, isSecureField: true, isFieldHasError: true, isFinishedEditing: true)
        XCTAssertNotNil(view2)
            
    }
    func testUIEyeActionChange() throws{
        let app = XCUIApplication()
        //TODO: Test to check that the secure to unsecure text field work. Test does not work.
        app.launch()
        let contraseASecureTextField = app.secureTextFields["Contraseña"]
        contraseASecureTextField.tap()
        contraseASecureTextField.typeText("12345")
        app.images["Visible"].tap()
        app.images["Invisible"].tap()
        contraseASecureTextField.tap()
        contraseASecureTextField.tap()
        XCTAssertNotEqual(contraseASecureTextField.placeholderValue, "123456")
     
    }
 
}
