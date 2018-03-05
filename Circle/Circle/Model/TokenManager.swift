//
//  TokenManager.swift
//  Circle
//
//  Created by Leonardo Augusto Piovezan on 05/03/18.
//  Copyright © 2018 Gabriel Branco Frizzo. All rights reserved.
//

import Foundation

class TokenManager {
    
    
    var accessToken: String? = ""
    var expiresIn: Int64? = 0
    var refreshToken: String? = ""
    
    
    init(dictionary: Dictionary<String,Any>){
        
        accessToken = dictionary["access_token"] as? String
        expiresIn = dictionary["expires_in"] as? Int64
        refreshToken = dictionary["refresh_token"] as? String
        
        
    }
    
    
//    required init(from decoder: Decoder) throws {
//
//        let values = try decoder.container(keyedBy: TokenManager.self)
//        latitude = try values.decode(Double.self, forKey: .latitude)
//        longitude = try values.decode(Double.self, forKey: .longitude)
//
//        let additionalInfo = try values.nestedContainer(keyedBy: AdditionalInfoKeys.self, forKey: .additionalInfo)
//        elevation = try additionalInfo.decode(Double.self, forKey: .elevation)
//    }

    
}
