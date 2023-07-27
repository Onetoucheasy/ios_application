//
//  HTTPMethod.swift
//  RestauranteOfertas
//
//  Created by Eric Olsson on 7/26/23.
//

import Foundation

/// Supported HTTP methods
public enum HTTPMethod: String {
    
    case connect = "CONNECT"
    case delete = "DELETE"
    case get = "GET"
    case head = "HEAD"
    case options = "OPTIONS"
    case patch = "PATCH"
    case post = "POST"
    case put = "PUT"
    case trace = "TRACE"
    
}
