//
//  UserSingleton.swift
//  Circle
//
//  Created by Leonardo Augusto Piovezan on 05/03/18.
//  Copyright © 2018 Gabriel Branco Frizzo. All rights reserved.
//

import Foundation


class UserSingleton{
    
    static let instance = UserSingleton()
    
    var user:User?
    
    var tokenManager:TokenManager?
    
    private init(){
        
    }
    
}
