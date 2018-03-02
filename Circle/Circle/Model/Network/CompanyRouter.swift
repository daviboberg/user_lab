//
//  CompanyRouter.swift
//  Circle
//
//  Created by Leonardo Augusto Piovezan on 01/03/18.
//  Copyright © 2018 Gabriel Branco Frizzo. All rights reserved.
//

import Moya

enum CompanyRouter{
    case getCompanyWith(token:String)
}

extension CompanyRouter:TargetType{
    var baseURL: URL {
        return URL(string: "https://app.pingboard.com/api/v2")!
    }
    
    var path: String {
        switch self {
        case .getCompanyWith:
            return "/companies/my_company"
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
        case .getCompanyWith(let token):
            return ["Authorization":"Bearer \(token)"]

        }

    }
    
    
}

