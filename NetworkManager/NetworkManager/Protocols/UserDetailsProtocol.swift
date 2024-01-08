//
//  UserDetailsProtocol.swift
//  NetworkManager
//
//  Created by Logesh Vijayan on 2024-01-08.
//

import Foundation
import Combine

protocol UserDetailsProtocol {
    func getUserData() -> AnyPublisher<Users,Error>
    func getDetailsForUser(id: String) -> AnyPublisher<User,Error>?
}
