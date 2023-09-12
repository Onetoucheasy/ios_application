//
//  OfferDetailViewUITest.swift
//  RestauranteOfertasUITests
//
//  Created by Camila Laura Lopez on 11/9/23.
//

import XCTest

final class OfferDetailViewUITest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testThatDetailComponentExist() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let detailView = OfferDetailView(
            offer: Offer(
                id: UUID(),
                title: "Primera Oferta",
                description: "Disfruta doble la comida.",
                image: "https://media.glamour.es/photos/616f6ddd16c8b9c6f6317eaf/master/w_1600%2Cc_limit/742412.jpg",
                startHour: Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date(),
                endHour: Calendar.current.date(byAdding: .hour, value: 3, to: Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()) ?? Date()),
            restaurant: Restaurant(
                id: UUID(),
                name: "Restaurant test",
                type: "Chino",
                picture:"https://media.glamour.es/photos/616f6ddd16c8b9c6f6317eaf/master/w_1600%2Cc_limit/742412.jpg"))
       
        XCTAssertNotNil(detailView)
      
        let detailCardView = try detailView.inspect().find(viewWithId: 1)
        let detailRestaurantView = try detailView.inspect().find(viewWithId: 3)
        let detailReviewView = try detailView.inspect().find(viewWithId: 2)

        XCTAssertNotNil(detailCardView)
        XCTAssertNotNil(detailRestaurantView)
        XCTAssertNotNil(detailReviewView)

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
        
        app.collectionViews/*@START_MENU_TOKEN@*/.scrollViews/*[[".cells.scrollViews",".scrollViews"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.otherElements.scrollViews.otherElements.scrollViews.otherElements.containing(.button, identifier:"Shushi Bar, 2 por 1 Sushi, 15:00 hs a 17:00 hs").children(matching: .button).matching(identifier: "Shushi Bar, 2 por 1 Sushi, 15:00 hs a 17:00 hs").element(boundBy: 0).tap()
        
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.children(matching: .image).element(boundBy: 2)/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeUp()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        elementsQuery.buttons["Deja tu reseña"].tap()
        
        let alertShow = app.alerts["Ups! Has sido mas rápido que nosotros"].isEnabled
        
        //THEN
        XCTAssertTrue(alertShow)
        
        let gotItButton = app.alerts["Ups! Has sido mas rápido que nosotros"].scrollViews.otherElements.buttons["Got it!"]
        gotItButton.tap()

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
