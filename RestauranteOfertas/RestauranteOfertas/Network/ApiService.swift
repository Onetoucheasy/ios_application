//
//  ApiService.swift
//  RestauranteOfertas
//
//  Created by Eric Olsson on 8/28/23.
//

import Foundation

enum endpointsV2: String {
    case all = "/offers"
    case alllocal = "/offerslocal"
    case offersimple = "/offer/id=123"
    case offer = "?id=25150cea-f951-4b93-9c2f-1ab5f8ec85e4"
}

class ApiService {
    static let shared = ApiService()
    let urlbase = "https://oneapibackend.free.beeceptor.com/api" // test url
    let urlbaseLocal = "http://127.0.0.1:8080/api"
    
    // seek all active offers
    func activeOffersRequest() -> URLRequest {
        
        // 1. Build the string
        // https://oneapibackend.free.beeceptor.com/api/offers
        let urlString: String = "\(urlbase)\(endpointsV2.all.rawValue)"
        // try using below for local call
//        let urlString: String = "\(urlbaseLocal)\(endpointsV2.alllocal.rawValue)"
        
        // 2. Build the url and request
        var request: URLRequest = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = HTTPMethodsV2.get
        
        // TODO: - Implement urlComponents instead of url string bits -
        // below are currently not in use
        var urlComponents = URLComponents()
        urlComponents.queryItems = [
            // TODO replace key below...
            URLQueryItem(name: "CDS-ApiKey", value: "uciEfKBulHfMpavLobwGaIE0XwZBaCqBQuSRQu4YaZiNWGyON1XNlG7djMJ9Ogt5"),
            URLQueryItem(name: "Authorization", value: "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2OTIzNTY5NTkuODI4NDI4LCJpc3MiOiJPbmV0b3VjaGVhc3kuUmVzdGF1cmFudGVPZmVydGFzIiwiaXNDb21wYW55IjoidHJ1ZSIsInR5cGUiOiJhY2Nlc1Rva2VuIiwic3ViIjoiRDUzNEQ4MjItNUMzQS00RjM1LTkzNzQtNThEREJCODNGODE2In0.gjxlp1myle1aPVljuZF06OHedpgCSnT7VaZlZTaMjXc")
        ]
        
        print("ApiService > heroRequest > request URL: \(request)\n")
        return request
        
    }
}

struct HTTPMethodsV2 {
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
    static let content = "application/json"
}

enum NetworkError: Error {
    case malformedURL
    case noData
    case statusCode(code: Int?)
    case decodingFailed
    case unknown
}
