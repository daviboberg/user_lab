//
//  User.swift
//  Circle
//
//  Created by Gabriel Branco Frizzo on 02/03/18.
//  Copyright © 2018 Gabriel Branco Frizzo. All rights reserved.
//

import Foundation
import UIKit
import RxSwift


class User: Decodable {
    var id: String?
    var first_name: String?
    var last_name: String?
    var email: String?
    var team: String?
    var job_title: String?
    var icon: String?
    var medium: String?
    var pictureUrl:String?
    
    
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
    
    
    
    
    init(dictionary: Dictionary<String,Any>){
        
        self.id = dictionary["id"] as? String
        self.first_name = dictionary["first_name"] as? String
        self.last_name = dictionary["last_name"] as? String
        self.email = dictionary["email"] as? String
        self.team = dictionary["team"] as? String
        self.job_title = dictionary["job_title"] as? String
        self.icon = dictionary["icon"] as? String
        self.medium = dictionary["medium"] as? String
        if let pictureUrlDictionary = dictionary["avatar_urls"] as? Dictionary<String,Any> {
            self.pictureUrl = pictureUrlDictionary["medium"] as? String
        }
     
        
        
    }
 

}
