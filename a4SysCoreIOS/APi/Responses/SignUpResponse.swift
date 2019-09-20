//
//  SignUpResponse.swift
//  Yopter
//
//  Created by Yoptersys on 4/19/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import Foundation
import ObjectMapper

public class SignUpResponse: Mappable
{
    public var token : String?
    public var customer : Customer?
    public var tokenYopter : String?
    
    public required init?(map: Map) { }
    
    public func mapping(map: Map) {
        token <- map["token"]
        customer <- map["customer"]
        tokenYopter <- map["tokenYopter"]
    }
}
