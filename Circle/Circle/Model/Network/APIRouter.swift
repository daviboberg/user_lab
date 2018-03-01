//
//  APIRouter.swift
//  Circle
//
//  Created by Leonardo Augusto Piovezan on 01/03/18.
//  Copyright © 2018 Gabriel Branco Frizzo. All rights reserved.
//

import Moya

enum AuthRouter{
    
    case authenticate(user:String,password:String)

}


extension AuthRouter:TargetType{
    var baseURL: URL {
        return URL(string: NetworkConstants.baseAuthenticationURL)!
    }
    
    var path: String {
        switch self {
        case .authenticate:
            return "/token?grant_type=password"
        }
    }
    
    var method: Method {
        
        switch self {
        case .authenticate:
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        if let parameters = parameters {
             return .requestParameters(parameters: parameters, encoding: parameterEncoding)
        } else {
             return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type":"application/x-www-form-urlencoded"]
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .authenticate(let username,let password):
            return ["username":username,"password":password]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    
}
