//
//  UsersCollectService.swift
//  Circle
//
//  Created by Giulia Cesar Padovani on 02/03/2018.
//  Copyright © 2018 Gabriel Branco Frizzo. All rights reserved.
//

import Foundation
import Moya
import RxSwift

protocol UsersCollectService {
    func getUsersCollect(token: String)->Single<Response>
    
}
