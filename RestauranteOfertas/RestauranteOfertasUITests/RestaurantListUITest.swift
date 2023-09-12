//
//  RestaurantListUITest.swift
//  RestauranteOfertasUITests
//
//  Created by Camila Laura Lopez on 11/9/23.
//

import XCTest

final class RestaurantListUITest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

     func testThatRestaurantListComponentExist() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
         
         //When
         let emailField = app.textFields["Correo Electrónico"]
         let passwordField = app.secureTextFields["Contraseña"]
         let loginButton = app.buttons["Inicia sesión"]

         //WHEN
         emailField.tap()
         emailField.typeText("noempresa@gmail.com")
         
         passwordField.tap()
         passwordField.typeText("123456")
         
         //Then
         loginButton.tap()
         app.buttons["Restaurantes"].tap()
         
         /*let restaurantListView = RestaurantsListView(viewModel: viewModel)
        
         XCTAssertNotNil(restaurantListView)
       
         let restaurantCardView = try restaurantListView.inspect().find(viewWithId: 1)
     

         XCTAssertNotNil(restaurantCardView)*/
                  
    
       
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
