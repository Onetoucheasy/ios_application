//
//  Endpoint.swift
//  RestauranteOfertas
//
//  Created by Eric Olsson on 7/26/23.
//

import Foundation

/// The protocol used to define the specifications necessary for a 'Network'.
internal protocol Endpoint {
    
    /// The provider's 'baseURLString'.
    var baseURLString: String { get }
    
    /// The path to be appended to 'baseURLString' to form the full 'URL'.
    var path: String { get }
    
    /// Query items to add to a URL
    var queryItems: [URLQueryItem]? { get }
    
    /// The HTTP method used in the request.
    var method: HTTPMethod { get }
    
    /// The headers to be added in the request.
    var headers: HTTPHeaders? { get }
    
    /// The parameters to be incoded in the request.
    var parameters: [String: Any]? { get }
    
    /// The data to be assigned in httpBdoy (only for .noEncoding paramenterEncoding)
    var body: Data? { get }
    
    /// The method used for parameter encoding.
    var parameterEncoding: ParameterEncoding { get }
    
    /// Show debug indo when request made
    var showDebugInfo: Bool { get }
    
}

internal extension Endpoint {
    
    /// Request directly from endpoint specs
    /// - Parameter type: Decodable type
    /// - Returns: AnyPublisher
    func request<T: Decodable>(type: T.Type, decoder: JSONDecoder = JSONDecoder()) async throws -> T {
        
        let request = self.makeRequest()
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if self.showDebugInfo {
            
            print("###########################################################################")
            if let httpResponse = response as? HTTPURLResponse {
                print("\nSTATUS CODE:\n\(httpResponse.statusCode)\n")
            }
            if let headers = request.allHTTPHeaderFields {
                print("HEADERS:\n\(headers)\n")
            }
            if let method = request.httpMethod {
                print("METHOD:\n\(method)\n")
            }
            if let url = response.url?.absoluteString {
                print("URL:\n\(url)\n")
            }
            if let bodyData = request.httpBody, let body = String(data: bodyData, encoding: .utf8) {
                print("BODY DATA:\n\(body)\n")
            }
            if let value = String(data: data, encoding: .utf8) {
                print("RESPONSE DATA:\n\(value)\n")
            }
            print("###########################################################################")
            
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(T.self, from: data)
        
    }
    
}

internal extension Endpoint {
    
    /// Create URLRequest from endpoint
    /// - Returns: URLRequest
    func makeRequest() -> URLRequest {
        
        // URL
        guard let url = URL(string: baseURLString) else { fatalError("Endpoint URL is invalid") }
        
        // URL Components
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        urlComponents?.path.append(path)
        urlComponents?.queryItems = queryItems
        
        guard let finalURL = urlComponents?.url else { fatalError("Endpoint path or query items are invalid") }
        
        var request = URLRequest(url: finalURL)
        request.timeoutInterval = 10
        
        // Method
        request.httpMethod = method.rawValue
        
        // Headers
        request.allHTTPHeaderFields = headers?.dictionary
        
        // Parameters
        switch parameterEncoding {
        case .URLEncoding:
            var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
            components?.queryItems = parameters?.map({
                URLQueryItem(name: $0.key, value: "\($0.value)")
            })
            request.url = components?.url
            
        case .JSONEncoding:
            if let params = parameters {
                request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
            
        case .noEncoding:
            request.httpBody = body
            
        }
        
        return request
        
    }

}
