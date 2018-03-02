//
//  LocalUser.swift
//  Circle
//
//  Created by Gabriel Branco Frizzo on 02/03/18.
//  Copyright © 2018 Gabriel Branco Frizzo. All rights reserved.
//

import Foundation

class LocalUser: User {
    
    func teste (){
        
        UserSingleton.shared.user = LocalUser()
    }
    
    var access_token: String = ""
    var expires_in: String = ""
    var refresh_token: String = ""
    
}


class UserSingleton{
    
    static let shared = UserSingleton()
    
    var user:LocalUser?
    
    private init(){
        
    }
    
    
}
