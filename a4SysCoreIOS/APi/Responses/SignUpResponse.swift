//
//  SignUpResponse.swift
//  Yopter
//
//  Created by Yoptersys on 4/19/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import Foundation
import ObjectMapper

class SignUpResponse: Mappable
{
    var token : String?
    var customer : Customer?
    var tokenYopter : String?
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        token <- map["token"]
        customer <- map["customer"]
        tokenYopter <- map["tokenYopter"]
    }
}
