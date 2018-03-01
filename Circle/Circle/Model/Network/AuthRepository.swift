//
//  AuthRepository.swift
//  Circle
//
//  Created by Leonardo Augusto Piovezan on 01/03/18.
//  Copyright © 2018 Gabriel Branco Frizzo. All rights reserved.
//

import Moya
import RxSwift

protocol AuthRepository {
    
    func authenticate(user:String, password:String)->Single<Response>
    
}
