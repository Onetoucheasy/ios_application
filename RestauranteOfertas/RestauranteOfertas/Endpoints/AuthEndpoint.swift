//
//  AuthEndpoint.swift
//  RestauranteOfertas
//
//  Created by Eric Olsson on 7/26/23.
//

import Foundation

enum AuthEndpoint {
    
    case signIn(email: String, password: String)
    case signUp(name: String, email: String, password: String, userType: String) //TODO: isCompany is a String in the backend
    
}

extension AuthEndpoint: Endpoint {
    
    var baseURLString: String {
        
        URLs.api
        
    }
    
    var path: String {
        
        switch self {
        case .signIn:
            return "/auth/signIn" // was /auth/signIn
        case .signUp:
            return "/auth/signUp"
            
        }
        
    }
    
    var queryItems: [URLQueryItem]? {
        
        nil
        
    }
    
    var method: HTTPMethod {
        
        switch self {
        case .signIn:
            return .get // was .get
            
        case .signUp:
            return .post
            
        }
        
    }
    
    var headers: HTTPHeaders? {
        
        var headers = HTTPHeaders()
        headers.add(HTTPHeader(name: "CDS-ApiKey", value: URLs.apiKey))
        // api = "https://dragonball.keepcoding.education/api/"
        
        
        switch self {
        case .signIn(let email, let password):
            headers.add(.authorization(username: email, password: password))
            
        default:
            break
            
        }
        
        return headers
        
    }
    
    var parameters: [String : Any]? {
        
        switch self {
        case .signUp(let name, let email, let password, let userType):
            return [
                "name": name,
                "email": email,
                "password": password,
                "isCompany": userType //TODO: Chenge "isCompany" in the database for userType and keepit as a string
            ]
            
        default:
            return nil
            
        }
        
    }
    
    var body: Data? {
        
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
