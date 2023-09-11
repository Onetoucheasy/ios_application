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

    func testExample() throws {
        // UI tests must launch the application that they test.
       /* let app = XCUIApplication()
        app.launch()

        let offerName = app.collectionViews/*@START_MENU_TOKEN@*/.scrollViews/*[[".cells.scrollViews",".scrollViews"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.otherElements.scrollViews.otherElements.scrollViews.otherElements.buttons["Pizza Pera, 3 x 1 en pizzas, 15:00 hs a 17:00 hs"].tap()
        
        XCTAssertNotNil(offerName)
        app.scrollViews.otherElements.staticTexts["Pizzas para todos"].swipeUp()
        app.children(matching: .window).element(boundBy: 0).tap()
        app.alerts["Ups! Has sido mas rápido que nosotros"].scrollViews.otherElements.buttons["Got it!"].tap()*/

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
