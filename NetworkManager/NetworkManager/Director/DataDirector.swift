//
//  DataDirector.swift
//  NetworkManager
//
//  Created by Logesh Vijayan on 2024-01-08.
//

import Foundation
import Combine

class DataDirector {
    
    static var shared = DataDirector()
    
    var apiManager: APIManagerProtocol = APIManager()
    
}

extension DataDirector: UserDetailsProtocol {
    
    func getUserData() -> AnyPublisher<Users, Error> {
        let state = RequestMapper.GetUserData
        return apiManager.get(type: Users.self, url: state.baseURL, headers: state.headers)
    }
    
    func getDetailsForUser(id: String) -> AnyPublisher<User, Error>? {
        return nil
    }
    
 
    
    
}
