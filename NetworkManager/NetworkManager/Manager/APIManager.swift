//
//  APIManager.swift
//  NetworkManager
//
//  Created by Logesh Vijayan on 2024-01-08.
//

import Foundation
import Combine

protocol APIManagerProtocol: AnyObject {
    
    typealias Headers = [String: Any]
    
    func get<T>(type: T.Type,
                url: URL,
                headers: Headers) -> AnyPublisher<T,Error> where T: Decodable
}

class APIManager: NSObject, APIManagerProtocol {
    
    
    func get<T>(type: T.Type, url: URL, headers: Headers) -> AnyPublisher<T, Error> where T : Decodable {
        
        var urlRequest = URLRequest(url: url)
        
        headers.forEach { key,value in
            if let value = value as? String{
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        print("Loki",urlRequest)
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .decode(type: type, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    
}
