//
//  RestaurantEndpoint.swift
//  RestauranteOfertas
//
//  Created by Camila Laura Lopez on 9/9/23.
//

import Foundation


enum RestaurantEndpoint {
    
    case all
    case restaurant(id: UUID)
}

extension RestaurantEndpoint: Endpoint {
    
    var baseURLString: String {
        URLs.api
    }
    
    var path: String {
        switch self {
        case .all:
            return "/restaurants"
        case .restaurant(let id):
            return "/restaurants/\(id)"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        nil // server will filter for active offers, where postTime => Now()
    }
    
    var method: HTTPMethod {
        .get // GET request
    }
    
    var headers: HTTPHeaders? {
        
        // CDS-ApiKey
        var headers = HTTPHeaders()
        headers.add(HTTPHeader(name: "CDS-ApiKey", value: URLs.apiKey))
        
        // Bearer Key Path Filtered Response Sign In > accessToken, obtained by logged in user
        let accessToken = (UserDefaults.standard.object(forKey: URLs.accessToken) as? String) ?? ""
        headers.add(.authorization(bearerToken: accessToken))
        
        return headers
    }
    
    var parameters: [String : Any]? {
        // get all offers, nothing to specify, with URL, all active offers will come
        nil
    }
    
    var body: Data? {
        // GET body always empty
        nil
    }
    
    var parameterEncoding: ParameterEncoding {
        .JSONEncoding
    }
    
    var showDebugInfo: Bool {
        #if DEBUG
        true
        #else
        false
        #endif
    }
}
