//
//  RootViewModel.swift
//  RestauranteOfertas
//
//  Created by Enrique Poyato Ortiz on 3/8/23.
//

import Foundation
import Combine

final class RootViewModel: ObservableObject {
    @Published var status = Status.none
    @Published var token = ""
    
    
    var suscriptors = Set<AnyCancellable>()
    
    /*func login(user: String, password: String){
        self.status = .loading
        URLSession.shared.dataTaskPublisher(for: BaseNetwork().getSessionLogin(user: user, password: password)).tryMap{
            guard let response = $0.response as? HTTPURLResponse, response.statusCode == 200 else{
                // error de login
                throw URLError(.badServerResponse)
            }
            
            // Login ok
            
            return String(decoding: $0.data, as: UTF8.self)
        }
        .receive(on: DispatchQueue.main)
        .sink { completion in
            switch completion {
            case .failure:
                print("login error")//self.status = Status.error(error: "Usuario/Clave incorrecto")
            case.finished:
                print("finished login")//self.status = Status.loaded
                self.status = .login
            }
        } receiveValue: { token in
            self.token = token
            print(token)
        }
        .store(in: &suscriptors)
    }*/

}
