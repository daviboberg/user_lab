//
//  CompanyServiceImpl.swift
//  Circle
//
//  Created by Leonardo Augusto Piovezan on 01/03/18.
//  Copyright © 2018 Gabriel Branco Frizzo. All rights reserved.
//

import Foundation
import Moya
import RxSwift


class CompanyServiceImpl:CompanyService{
    
    
    private var provider: MoyaProvider<CompanyRouter>
    
    init(provider: MoyaProvider<CompanyRouter>) {
        self.provider = provider
    }
    
    
    func getCompanyWith(token:String) -> PrimitiveSequence<SingleTrait, Response> {
        
        return provider.rx.request(.getCompanyWith(token:token)).filter(statusCode: 200)
        
    }
    
    
    
}
