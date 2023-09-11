//
//  StyleTest.swift
//  RestauranteOfertasUITests
//
//  Created by Alberto Junquera Ramírez on 11/9/23.
//

import XCTest
import SwiftUI

final class StyleTest: XCTestCase {

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
        let view = SignUpView()
        let buttonToTest = try view.inspect().find(viewWithId: 11)

        let buttonStyle = try buttonToTest.buttonStyle()

        let n = 1
        
        // Create a test configuration
//
//        try buttonToTest.style(ChangeUserTypeButtonStyle.self)
//                    .configurationLabelView().text().string()
//                    .assertEqual("Test Button")
//                    .gestureTap()
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
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
