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
    
    func saveUser(user: LocalUser) {
        
        defaults.set(user.access_token, forKey: "access_token")
        defaults.set(user.refresh_token, forKey: "refresh_token")
        defaults.set(user.expires_in, forKey: "expires_in")
        
        defaults.set(user.id, forKey: "id")
        defaults.set(user.first_name, forKey: "first_name")
        defaults.set(user.last_name, forKey: "last_name")
        defaults.set(user.email, forKey: "email")
        defaults.set(user.team, forKey: "team")
        defaults.set(user.job_title, forKey: "job_title")
        defaults.set(user.icon, forKey: "icon")
        defaults.set(user.medium, forKey: "medium")
    }
    
    func loadUser() -> LocalUser{
        
        let defaults = UserDefaults.standard
        let user = LocalUser()
        
        if let access_token = defaults.string(forKey: "access_token"){
            user.access_token = access_token
        }
        if let expires_in = defaults.object(forKey: "expires_in") as? integer_t{
            user.expires_in = String(expires_in)
        }
        if let refresh_token = defaults.string(forKey: "refresh_token"){
            user.refresh_token = refresh_token
        }
        
        if let id = defaults.string(forKey: "id"){
            user.id = id
        }
        if let first_name = defaults.string(forKey: "first_name"){
            user.first_name = first_name
        }
        if let last_name = defaults.string(forKey: "last_name"){
            user.last_name = last_name
        }
        if let email = defaults.string(forKey: "email"){
            user.email = email
        }
        if let team = defaults.string(forKey: "team"){
            user.team = team
        }
        if let job_title = defaults.string(forKey: "job_title"){
            user.job_title = job_title
        }
        if let icon = defaults.string(forKey: "icon"){
            user.icon = icon
        }
        if let medium = defaults.string(forKey: "medium"){
            user.medium = medium
        }
        
        return user
    }
}
