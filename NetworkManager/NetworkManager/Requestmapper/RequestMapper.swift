//
//  RequestMapper.swift
//  NetworkManager
//
//  Created by Logesh Vijayan on 2024-01-08.
//

import Foundation

enum RequestMapper {
    case GetUserData
    case FetchNews
    case UpdatePosts
    
    var baseURL: URL {
        var components = URLComponents()
        components.scheme = "https"
        switch self {
        case .GetUserData:
            components.host = "dummyapi.io"
        case .FetchNews:
            components.host = "dummyapi.io"
        case .UpdatePosts:
            components.host = "dummyapi.io"
        }
        components.path = self.path
        components.queryItems = self.queryItem
        guard let url = components.url else { preconditionFailure("Invalid URl")}
        return url
    }
    

    
    var path: String {
        switch self {
        case .GetUserData:
            return "/data/v1/user"
        case .FetchNews:
            return "/news/language"
        case .UpdatePosts:
            return "/update/posts"
        }
    }
    
    var headers: [String: Any] {
        switch self {
        case .GetUserData:
            return ["app-id": "659c3633e75fe3043bd8fd90"]
        case .FetchNews:
            return ["app-id": "659c3633e75fe3043bd8fd90"]
        case .UpdatePosts:
            return ["app-id": "659c3633e75fe3043bd8fd90"]
        }
    }
    
    var queryItem: [URLQueryItem]? {
        switch self {
        case .GetUserData:
            return [
                URLQueryItem(name: "limit",
                             value: "\(10)")
            ]
        case .FetchNews:
            return nil
        case .UpdatePosts:
            return nil
        }
    }
    
}
