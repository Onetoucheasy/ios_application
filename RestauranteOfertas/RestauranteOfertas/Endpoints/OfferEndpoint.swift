//
//  OfferEndpoint.swift
//  RestauranteOfertas
//
//  Created by Eric Olsson on 8/23/23.
//
/// Used to build the api request
import Foundation

enum OffersEndpoint {
    
    case all
    // case byRestaurant // TODO: choose between a) let server decide, or b) filter/query locally
    case alllocal
    case offer(id: UUID)
}

extension OffersEndpoint: Endpoint {
    
    var baseURLString: String {
        URLs.apimock2 // file: General, api = "http://127.0.0.1:8080/api" OR... "https://oneapibackend.free.beeceptor.com/api"
    }
    
    var path: String {
        switch self {
        case .all:
            return "/offers"
        case .alllocal: // TODO: remove
            return "/offerslocal"
        case .offer(let id):
            return "/offer/\(id)"
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
