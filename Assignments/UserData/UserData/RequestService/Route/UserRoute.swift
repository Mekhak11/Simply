//
//  UserRoute.swift
//  UserData
//
//  Created by MEKHAK GHAPANTSYAN on 02.10.24.
//

import Foundation

enum UserRoute {
    case getUsers(page: Int, results: Int)
}

extension UserRoute: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://randomuser.me")!
    }
    
    var path: String {
        switch self {
        case .getUsers:
            return "/api/"
        }
    }
    
    var method: String {
        return "GET"
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .getUsers(let page, let results):
            return ["page": page, "results": results]
        }
    }
}
