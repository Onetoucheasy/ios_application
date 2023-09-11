//
//  UtilsTest.swift
//  RestauranteOfertasTests
//
//  Created by Alberto Junquera Ramírez on 11/9/23.
//

import XCTest

final class UtilsTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
      //SUT TimeFormattingUtility. Check if the Date into HH:mm formatter works.
        
        //Given:
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let testDate = dateFormatter.date(from: "2023-09-5 14:30:00")

        //When:
        let testResult = TimeFormattingUtility.getFormattedTime(date: testDate!)
        //Then
        XCTAssertEqual(testResult, "14:30")
    }

  

}
