//
//  JWTInteractorProtocol.swift
//  RestauranteOfertasTests
//
//  Created by Alberto Junquera Ramírez on 21/8/23.
//

import Foundation
import Combine

protocol JWTInteractorProtocol: AnyObject{
    func getJWTTokens(userType: UserType) -> AnyPublisher<SessionToken, Error>
}

final class JWTInteractorTesting: JWTInteractorProtocol{
  
    func getJWTTokens(userType: UserType) -> AnyPublisher<SessionToken, Error> {
        var accessToken = ""
        var refreshToken = ""
        if userType == .Company{
             accessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2OTI2NTAwODMuMzQ3NjcyOSwiaXNzIjoiT25ldG91Y2hlYXN5LlJlc3RhdXJhbnRlT2ZlcnRhcyIsImlzQ29tcGFueSI6InRydWUiLCJ0eXBlIjoiYWNjZXNUb2tlbiIsInN1YiI6Ijg2NkEyNzYwLTJDQ0EtNEY4Qi04MUE5LUZBMDgyMjQwODhENyJ9.vZ2iZEc7gP75y4LT_gDp1tKeJz1aS4rIloUQzkT25dI"
             refreshToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2OTMyNTMwODMuMzQ3NjcyOSwiaXNzIjoiT25ldG91Y2hlYXN5LlJlc3RhdXJhbnRlT2ZlcnRhcyIsImlzQ29tcGFueSI6InRydWUiLCJ0eXBlIjoicmVmcmVzaFRva2VuIiwic3ViIjoiODY2QTI3NjAtMkNDQS00RjhCLTgxQTktRkEwODIyNDA4OEQ3In0.2-W63oZ4EOq9CU550snjjyHKc3Ywt-JDHp4t8KYwhuk"
        }else{
             accessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2OTIyODIxNjAuMDIyMDc4LCJpc3MiOiJPbmV0b3VjaGVhc3kuUmVzdGF1cmFudGVPZmVydGFzIiwiaXNDb21wYW55IjoiZmFsc2UiLCJ0eXBlIjoiYWNjZXNUb2tlbiIsInN1YiI6IjRBMEYzRkQyLTJCN0QtNDgyNS04MTczLUEzMUJCRURGMUVEMyJ9.AbldqpiFQEu_tPAuyoIB-o1N7o90x4nW3CrNn5RkbiY"
             refreshToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2OTI4ODUxNjAuMDIyMDc4LCJpc3MiOiJPbmV0b3VjaGVhc3kuUmVzdGF1cmFudGVPZmVydGFzIiwiaXNDb21wYW55IjoiZmFsc2UiLCJ0eXBlIjoicmVmcmVzaFRva2VuIiwic3ViIjoiNEEwRjNGRDItMkI3RC00ODI1LTgxNzMtQTMxQkJFREYxRUQzIn0.BCL4C1i3fhFWks4EhS9CHVsg_PgcnCQsQdVuf-HivcM"
        }
        let sessionToken = SessionToken(accessToken: accessToken, refreshToken: refreshToken)
        let publisher = CurrentValueSubject<SessionToken, Error>(sessionToken)
        return publisher.eraseToAnyPublisher()
    }
    
    
}
