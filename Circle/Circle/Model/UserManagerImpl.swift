//
//  UserManagerImpl.swift
//  Circle
//
//  Created by Davi Boberg on 02/03/18.
//  Copyright © 2018 Gabriel Branco Frizzo. All rights reserved.
//

import Foundation

class UserManagerImpl : UserManager{
    
    let defaults = UserDefaults.standard
    
    func saveUser(user: Any) {
        
        
        if let jsonResult = user as? Dictionary<String, AnyObject> {
            
            defaults.set(jsonResult["access_token"] as! String, forKey: "acces_token")
            defaults.set(jsonResult["refresh_token"] as! String, forKey: "refresh_token")
            defaults.set(jsonResult["expires_in"] as! integer_t, forKey: "expires_in")
        }
    }
    
    func getUser(){
        
        
        if let access_token = defaults.string(forKey: "access_token"){
            print(access_token)
        }
        if let expires_in = defaults.object(forKey: "expires_in") as? integer_t{
            print(expires_in)
        }
        
        if let refresh_token = defaults.string(forKey: "refresh_token"){
            print(refresh_token)
        }
    }
    
    
}
