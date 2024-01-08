//
//  UserViewModel.swift
//  NetworkManager
//
//  Created by Logesh Vijayan on 2024-01-08.
//

import Foundation
import Combine

class UserViewModel {
    
    //MARK: User Data
    var users: Users?
    var completionHandler : (() -> Void)?
    
    //MARK: - Data Director
    var director: UserDetailsProtocol = DataDirector.shared
    var cancellables = Set<AnyCancellable>()
    
    //MARK: - Function to get user data
    func getUserData(completionHandler: (() -> Void)? = nil) {
        director.getUserData()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    completionHandler!()
                case .failure(_):
                    print("Loki failed in api call")
                }
                
            }, receiveValue: { userData in
                self.users = userData
            })
            .store(in: &cancellables)
    }
}
