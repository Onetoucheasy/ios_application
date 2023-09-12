//
//  OfferDetailViewModelTest.swift
//  RestauranteOfertasTests
//
//  Created by Camila Laura Lopez on 10/9/23.
//

import XCTest

final class OfferDetailViewModelTest: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    @MainActor func testIfCallGetAnOfferReturnASpecifOffer() async throws {
        
        //SUT: When getAnOffer BY ID is call, it would return a Offer
        
        //Given:
        //Instanciar el ViewModel
        let offerID = UUID(uuidString: "d3b79cfe-501b-11ee-be56-0242ac120002")!
        let vm = OfferDetailViewModelForTest(offerId: offerID)
        XCTAssertNotNil(vm)
        
        //When
        try await vm.getOfferByID(id: UUID())
        
        //There
        XCTAssertEqual(vm.offer?.id, offerID)
    }
}
