//
//  Restaurant.swift
//  RestauranteOfertas
//
//  Created by Enrique Poyato Ortiz on 7/8/23.
//

import Foundation

struct Restaurant: Identifiable{
    var id: UUID = UUID()
    var name: String
    var offerts: [Offert]?
}

func getRestaurants() -> [Restaurant] {
    let startDate = Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()
    let endDate = Calendar.current.date(byAdding: .hour, value: 3, to: startDate) ?? Date()
    
    let restaurant1 = Restaurant(name: "Restaurante 1", offerts: [Offert(offertName: "Pack Sorpresa", distance: 756, startTime: startDate, endTime: endDate), Offert(offertName: "Pack Sorpresa", distance: 756, startTime: startDate, endTime: endDate), Offert(offertName: "Pack Sorpresa", distance: 50, startTime: startDate, endTime: endDate), Offert(offertName: "Pack Sorpresa", distance: 756, startTime: startDate, endTime: endDate)])
    
    let restaurant2 = Restaurant(name: "Restaurante 2", offerts: [Offert(offertName: "Pack Sorpresa", distance: 460, startTime: startDate, endTime: endDate), Offert(offertName: "Pack Sorpresa", distance: 756, startTime: startDate, endTime: endDate), Offert(offertName: "Pack Sorpresa", distance: 200, startTime: startDate, endTime: endDate), Offert(offertName: "Pack Sorpresa", distance: 756, startTime: startDate, endTime: endDate)])
    
    let restaurant3 = Restaurant(name: "Restaurante 3", offerts: [Offert(offertName: "Pack Sorpresa", distance: 300, startTime: startDate, endTime: endDate)])


    
    
    return [restaurant1, restaurant2, restaurant3]
}
