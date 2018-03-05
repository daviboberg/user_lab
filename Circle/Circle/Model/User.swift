//
//  User.swift
//  Circle
//
//  Created by Gabriel Branco Frizzo on 02/03/18.
//  Copyright © 2018 Gabriel Branco Frizzo. All rights reserved.
//

import Foundation
import UIKit



class User: Decodable {
    var id: String?
    var first_name: String?
    var last_name: String?
    var email: String?
    var team: String?
    var job_title: String?
    var icon: String?
    var medium: String?
    
    init(response: Any){
        let decoder = JSONDecoder()
        do{
            let info = try decoder.decode(User.self, from: response as! Data)
            print(info)
        } catch {
            print("Error parsing JSON")
        }
    }
    
    init(){
        id = "1"
        first_name = "Gabriel"
        last_name = "Frizzo"
        email = "gabriel@frizzo.com"
        team = "Codelab"
        job_title = "Testar"
        icon = "frizzo.com"
        medium = "frizzo.org"
    }
}
