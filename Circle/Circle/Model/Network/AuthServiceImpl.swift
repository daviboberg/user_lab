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

class AuthServiceImpl: AuthService {
 
    let provider: MoyaProvider<AuthRouter>
    
    init(provider: MoyaProvider<AuthRouter>) {
        self.provider = provider
    }
    
    func authenticate(user: String, password: String) -> Single<Response> {
        return provider.rx.request(.authenticate(user: user, password: password)).filter(statusCode: 200)
    }
    
    
    func authenticate(user: String,password:String, completion: @escaping (_ result: Data) -> Void) {
        
        provider.request(.authenticate(user: user, password: password)) { (result) in
            
        
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                let statusCode = moyaResponse.statusCode
         
                let json = try! JSONSerialization.jsonObject(with: data, options: [])
                
                print(statusCode)
                print(json)
                completion(data)
                
                
            case let .failure(error):
                print("Deu ruim. Erro: \(error)")
                completion(Data())
            }
        }
        
        
    }
    
    
}

