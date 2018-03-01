//
//  NetworkConstants.swift
//  Circle
//
//  Created by Leonardo Augusto Piovezan on 01/03/18.
//  Copyright © 2018 Gabriel Branco Frizzo. All rights reserved.
//

import Foundation

struct NetworkConstants {
    
    #if DEBUG
    static let baseAuthenticationURL = "https://app.pingboard.com/oauth"
    static let baseApplicationURL = "https://app.pingboard.com/api/v2"
    #else
    static let baseAuthenticationURL = "https://app.pingboard.com/oauth"
    static let baseApplicationURL = "https://app.pingboard.com/api/v2"
    #endif
    
    private init() {}
}
