//
//  AuthService.swift
//  Circle
//
//  Created by Leonardo Augusto Piovezan on 01/03/18.
//  Copyright © 2018 Gabriel Branco Frizzo. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import Moya_ModelMapper

class AuthService: AuthRepository {
    let provider: MoyaProvider<AuthRouter>
    
    init() {
        provider = MoyaProvider<AuthRouter>()
    }
    
    func authenticate(user: String, password: String) -> Single<Response> {
        return provider.rx.request(.authenticate(user: user, password: password))
    }
    func authenticate(user: String,password:String, completion: @escaping (_ result: Data) -> Void) {
        
        provider.request(.authenticate(user: user, password: password)) { (result) in
            
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                let statusCode = moyaResponse.statusCode
         
                print(statusCode)
                
                completion(data)
                
            case let .failure(error):
                print("Deu ruim. Erro: \(error)")
                completion(Data())
            }
        }
        
        
    }
    
    
}

