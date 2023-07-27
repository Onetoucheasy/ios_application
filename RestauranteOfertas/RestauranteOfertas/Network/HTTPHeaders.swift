//
//  HTTPHeaders.swift
//  RestauranteOfertas
//
//  Created by Eric Olsson on 7/26/23.
//

import Foundation

internal struct HTTPHeaders {

    // MARK: - Properties
    var headers = [HTTPHeader]()
    
    // MARK: Custom
    init() { }
    
    /// Init with array
    /// - Parameter headers: HTTPHeader array
    init(_ headers: [HTTPHeader]) {
        self.init()

        self.headers = headers
        
    }
    
    /// Init with raw dictionary
    /// - Parameter dictionary: Dictionary
    init(_ dictionary: [String: String]) {
        self.init()

        self.headers = dictionary.map({ HTTPHeader(name: $0, value: $1) })
        
    }
    
    /// Add raw header by name/value
    /// - Parameters:
    ///   - name: Name
    ///   - value: Value
    mutating func add(name: String, value: String?) {
        
        if let value = value {
            headers.append(HTTPHeader(name: name, value: value))
        }
        
    }
    
    /// Add HTTPHeader
    /// - Parameter header: Header
    mutating func add(_ header: HTTPHeader) {
        
        headers.append(header)
        
    }
    
    /// Remove header by name
    /// - Parameter name: Header name
    mutating func remove(name: String) {
        
        guard let index = headers.firstIndex(where: { $0.name == name }) else { return }
        headers.remove(at: index)
        
    }

    /// The dictionary representation of all headers.
    ///
    /// This representation does not preserve the current order of the instance.
    var dictionary: [String: String] {
        
        let namesAndValues = headers.map { ($0.name, $0.value) }
        return Dictionary(namesAndValues, uniquingKeysWith: { _, last in last })
        
    }
    
}

extension HTTPHeaders: ExpressibleByDictionaryLiteral {
    
    init(dictionaryLiteral elements: (String, String)...) {
        self.init()

        elements.forEach { add(name: $0.0, value: $0.1) }
        
    }
    
}

internal struct HTTPHeader: Hashable {
    
    // MARK: - Properties
    let name: String
    let value: String
    
    init(name: String, value: String) {
        self.name = name
        self.value = value
    }
    
}

internal extension HTTPHeader {
    
    static func accept(_ value: String) -> HTTPHeader {
        HTTPHeader(name: "Accept", value: value)
    }
    
    static func acceptCharset(_ value: String) -> HTTPHeader {
        HTTPHeader(name: "Accept-Charset", value: value)
    }
    
    static func acceptLanguage(_ value: String) -> HTTPHeader {
        HTTPHeader(name: "Accept-Language", value: value)
    }
    
    static func acceptEncoding(_ value: String) -> HTTPHeader {
        HTTPHeader(name: "Accept-Encoding", value: value)
    }
    
    static func authorization(username: String, password: String) -> HTTPHeader {
        let credential = Data("\(username):\(password)".utf8).base64EncodedString()
        return authorization("Basic \(credential)")
    }
    
    static func authorization(bearerToken: String) -> HTTPHeader {
        authorization("Bearer \(bearerToken)")
    }
    
    static func authorization(_ value: String) -> HTTPHeader {
        HTTPHeader(name: "Authorization", value: value)
    }
    
    static func contentDisposition(_ value: String) -> HTTPHeader {
        HTTPHeader(name: "Content-Disposition", value: value)
    }
    
    static func contentType(_ value: String) -> HTTPHeader {
        HTTPHeader(name: "Content-Type", value: value)
    }
    
    static func userAgent(_ value: String) -> HTTPHeader {
        HTTPHeader(name: "User-Agent", value: value)
    }
    
}

extension HTTPHeader {
    
    /// Default Accep-Encoding header
    static let defaultAcceptEncoding: HTTPHeader = {
        
        let encodings = ["br", "gzip", "deflate"]
        return .acceptEncoding(encodings.qualityEncoded())
        
    }()
    
    /// Default Accept-Language header
    static let defaultAcceptLanguage: HTTPHeader = {
        
        .acceptLanguage(Locale.preferredLanguages.prefix(6).qualityEncoded())
        
    }()
    
}

extension Collection where Element == String {
    
    /// Add quality to values
    func qualityEncoded() -> String {
        
        return enumerated().map { index, encoding in
            let quality = 1.0 - (Double(index) * 0.1)
            return "\(encoding);q=\(quality)"
        }.joined(separator: ", ")
        
    }
    
}
