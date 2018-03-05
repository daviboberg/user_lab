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

extension UsersCollectRouter:TargetType {
    var baseURL: URL {
        return URL(string: "https://app.pingboard.com/api/v2")!
    }
    
    var path: String {
        switch self {
        case .getUsersCollect:
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
        case .getUsersCollect(let token):
            return ["Authorization":"Bearer \(token)"]
            
        }
    }
    
}
