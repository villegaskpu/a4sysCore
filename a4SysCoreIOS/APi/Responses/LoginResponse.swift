//
//  LoginResponse.swift
//  Yopter
//
//  Created by Yoptersys on 4/19/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import Foundation
import ObjectMapper

open class LoginResponse: Mappable
{
    public var status : String?
    public var registrationKey : String?
    public var token : String?
    var customer : Customer?
    public var tokenYopter : String?
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        status <- map["status"]
        registrationKey <- map["registrationKey"]
        token <- map["token"]
        customer <- map["customer"]
        tokenYopter <- map["tokenYopter"]
    }
}
