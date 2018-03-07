//
//  UsersCollectRouter.swift
//  Circle
//
//  Created by Giulia Cesar Padovani on 02/03/2018.
//  Copyright © 2018 Gabriel Branco Frizzo. All rights reserved.
//

import Moya

enum UsersCollectRouter {
    case getUsersCollect(token:String)
}

/*
enum UsersCollectRouter {
    case getUsersCollect(token:String, pageSize: Int)
}
*/

extension UsersCollectRouter:TargetType {
    var baseURL: URL {
        return URL(string: "https://app.pingboard.com/api/v2")!
    }
    
    var path: String {
        switch self {
        case .getUsersCollect:
            return "/users"
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
    
    /*
    var task: Task {
        if let parameters = self.parameters {
            return .requestParameters(parameters: parameters, encoding: parameterEncoding)
        } else {
            return .requestPlain
        }
    }
    */
    
    var headers: [String : String]? {
        switch self {
        case .getUsersCollect(let token):
            return ["Authorization":"Bearer \(token)"]
            
        }
    }
    
    /*
    var parameters: [String : Any]? {
        switch self {
        case .getUsersCollect(_,let pageSize):
            return ["pageSize": "page_size= \(pageSize)"]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.httpBody
    }
    */
    
}
