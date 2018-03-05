//
//  UserServiceImpl.swift
//  Circle
//
//  Created by Giulia Cesar Padovani on 05/03/2018.
//  Copyright © 2018 Gabriel Branco Frizzo. All rights reserved.
//
import Foundation
import Moya
import RxSwift

class UserServiceImpl:UserService {
    
    init(provider: MoyaProvider<UserRouter>) {
        self.provider = provider
    }
    
    private var provider:MoyaProvider<UserRouter>

    func getUser(token: String, id: String) -> PrimitiveSequence<SingleTrait, Response> {
        return provider.rx.request(.getUser(token:token, id:id)).filter(statusCode: 200)
    }
}
