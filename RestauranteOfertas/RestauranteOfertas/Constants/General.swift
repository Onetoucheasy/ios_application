//
//  General.swift
//  RestauranteOfertas
//
//  Created by Eric Olsson on 7/26/23.
//

import Foundation

struct URLs {
    
    // General
    static let appStore = "itms-apps://itunes.apple.com/app/id1547576305"
    static let accessToken = "accessToken"
    static let refreshToken = "refreshToken"
    
    static let api = "http://127.0.0.1:8080/api"
   // static let apimock = "https://oneapibackend.free.beeceptor.com/api"
   // static let apimock2 = "https://us-central1-projectkc-6ca03.cloudfunctions.net/offers"
    static let apiKey: String = { ProcessInfo.processInfo.environment["API_KEY"] ?? "" }()
    
}
