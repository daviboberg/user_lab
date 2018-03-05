//
//  UserService.swift
//  Circle
//
//  Created by Giulia Cesar Padovani on 05/03/2018.
//  Copyright © 2018 Gabriel Branco Frizzo. All rights reserved.
//

import Moya
import RxSwift

protocol UserService {
    func getUser(token: String, id: String)->Single<Response>

}
