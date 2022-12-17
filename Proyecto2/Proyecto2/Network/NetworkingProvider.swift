//
//  NetworkingProvider.swift
//  Proyecto2
//
//  Created by Guadalupe Morales carmona on 17/12/22.
//

import Foundation
import Alamofire

final class NetworkingProvider {
    
    static let shared = NetworkingProvider()
    private let url = "https://api.chucknorris.io/jokes/random"
    private let kStatusOk = 200...299
    //GET method
    
    
    func getJoke(success: @escaping (_ joke: DataJoke) -> (), failure: @escaping (_ error: Error?) -> ()){
        
        AF.request(url).validate(statusCode: kStatusOk).responseDecodable( of: DataJoke.self) { response in
            if let joke = response.value {
              success(joke)
            } else {
                failure(response.error)
            }
        }
    }
}

