//
//  RestaurantListViewModelTest.swift
//  RestauranteOfertasTests
//
//  Created by Camila Laura Lopez on 10/9/23.
//

import XCTest

final class RestaurantListViewModelTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor func testIfCallAllRestaurantGetAListOfRestaurant() async throws {
      
        //SUT: When getallrestaurant is call, it would return a list of restaurants
        
        //Given:
        let vm = RestaurantListViewModelForTest(fail: false)
        XCTAssertNotNil(vm)
       
        //When
        try await vm.getAllRestaurant()
        
        //Then
        XCTAssertEqual(vm.restaurants!.count, 3)
    }
    
    @MainActor func testIfCallAllRestaurantGetANil() async throws {
      
        //SUT: When getallrestaurant is call, it would return a list of restaurants
        
        //Given:
        let vm = RestaurantListViewModelForTest(fail: true)
        XCTAssertNotNil(vm)
       
        //When
        try await vm.getAllRestaurant()
        
        //Then
        XCTAssertNil(vm.restaurants)
    }
    
    //MARK: - AñadidoAlberto
    //TODO: - Este es el que te decía que si la nase de datos está conectada falla porque la lista de restaurantes no es nil. 
    @MainActor func testIfRestaurantListViewModelTestExistThenReturnNotNil() async throws {
      
        //SUT: When getallrestaurant is call, it would return a list of restaurants
        
        //Given:
        let vm = RestaurantListViewModel()
        XCTAssertNotNil(vm)
       
        //When the database is offline.
        try await vm.getAllRestaurant()
        
        //Then
        XCTAssertNil(vm.restaurants)
    }
    
    
  
}
