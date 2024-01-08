//
//  UserModel.swift
//  NetworkManager
//
//  Created by Logesh Vijayan on 2024-01-08.
//

import Foundation

struct Users: Codable{
    let data: [User]?
}

struct User: Codable {
    let id: String?
    let title: String?
    let firstName: String?
    let lastName: String?
    let email: String?
    let picture: String?
}
