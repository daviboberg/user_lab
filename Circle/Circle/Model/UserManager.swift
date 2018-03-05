//
//  UserManager.swift
//  Circle
//
//  Created by Davi Boberg on 02/03/18.
//  Copyright © 2018 Gabriel Branco Frizzo. All rights reserved.
//

import Foundation

protocol UserManager {
    
    func saveUser(user: LocalUser)
    func loadUser() -> LocalUser
}
