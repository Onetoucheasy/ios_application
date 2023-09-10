//
//  OfferListViewModelTest.swift
//  RestauranteOfertasTests
//
//  Created by Camila Laura Lopez on 10/9/23.
//

import XCTest

final class OfferListViewModelTest: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }    
    
    @MainActor func testIfCallOfferListWillGetAListOfRestaurantWithOffers() async throws {
        
        //SUT: When get is call getActiveOffers, it would return a list of restaurants with offersnested
        
        //Given:
        
        let vm = OfferListViewModelForTest()
        XCTAssertNotNil(vm)
        
        //When
        try await vm.getActiveOffers()
    
        //There
        XCTAssertEqual(vm.restaurantsOfferNested?.count, 2)
        XCTAssertNotNil(vm.restaurantsOfferNested?.first?.offers)
        
    }
    
}
