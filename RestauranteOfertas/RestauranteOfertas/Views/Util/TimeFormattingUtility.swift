//
//  TimeFormattingUtility.swift
//  RestauranteOfertas
//
//  Created by Camila Laura Lopez on 9/9/23.
//

import Foundation


struct TimeFormattingUtility {
    static func getFormattedTime(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm" // Formato de hora (24 horas) y minutos
        
        return dateFormatter.string(from: date)
    }
}
