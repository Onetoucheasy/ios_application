//
//  BaseNetwork.swift
//  RestauranteOfertas
//
//  Created by Eric Olsson on 7/26/23.
//
// segundo método para llamada al api, no está utilizado ahora
import Foundation

//let server = "https://127.0.0.1:8080"
let server = "http://127.0.0.1:8080"

struct HTTPMethods {
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
    static let content = "application/json"
}

enum endpoints : String {
    case login = "/api/auth/login"
    case activeOffers = "/api/activeoffers" // o "/api/offers"
}


struct BaseNetwork {
    
    //funcion que devuelve el request
    func getSessionLogin(user:String, password: String) -> URLRequest {
        let urlcad : String = "\(server)\(endpoints.login.rawValue)"
        
        let encodeCredential = "\(user):\(password)".data(using: .utf8)?.base64EncodedString()
        var segCredentials :String = ""
        
        if let credential = encodeCredential{
            segCredentials = "Basic \(credential)"
        }
 
        //creamos al request
        var request : URLRequest = URLRequest(url: URL(string: urlcad)!)
        request.httpMethod = HTTPMethods.post
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
        request.addValue(segCredentials, forHTTPHeaderField: "Authorization")
        
        return request
    }
    
//    func getActiveOffers () -> URLRequest {
//        
//    }
}
