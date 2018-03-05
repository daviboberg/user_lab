//
//  UserRouter.swift
//  Circle
//
//  Created by Giulia Cesar Padovani on 02/03/2018.
//  Copyright © 2018 Gabriel Branco Frizzo. All rights reserved.
//

import Moya

enum UserRouter {
    case getUser(token:String, id: String)
}

extension UserRouter:TargetType {
    
    var baseURL: URL {
        return URL(string: "https://app.pingboard.com/api/v2")!
    }
    
    var path: String {
        switch self {
        case .getUser:
            return "/users?"
        }
    }
    
    var method: Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        switch self {
        case .getUser(let token):
            return ["Authorization":"Bearer \(token)"]
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .getUser(let id):
            return ["id":id]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.httpBody
    }
}

