//
//  SessionToken.swift
//  RestauranteOfertas
//
//  Created by Eric Olsson on 7/26/23.
//

import Foundation

struct SessionToken: Decodable {
    
    let accessToken: String
    let refreshToken: String
    
}
