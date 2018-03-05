//
//  UsersCollectServiceImpl.swift
//  Circle
//
//  Created by Giulia Cesar Padovani on 02/03/2018.
//  Copyright © 2018 Gabriel Branco Frizzo. All rights reserved.
//

import Foundation
import Moya
import RxSwift

class UsersCollectServiceImpl:UsersCollectService {
    
    init(provider: MoyaProvider<UsersCollectRouter>) {
        self.provider = provider
    }
    
    private var provider:MoyaProvider<UsersCollectRouter>
    
    func getUsersCollect(token: String) -> PrimitiveSequence<SingleTrait, Response> {
        return provider.rx.request(.getUsersCollect(token:token))
//            .filter(statusCode: 200)
    }
    

}
