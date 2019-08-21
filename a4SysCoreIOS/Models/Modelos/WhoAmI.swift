//
//  WhoAmI.swift
//  Push
//
//  Created by Yopter Big Data on 10/01/18.
//  Copyright © 2018 Yopter. All rights reserved.
//

import ObjectMapper

open class WhoAmI : Mappable
{
    public var name : String?
    public var logoURL : String?
    public var message : String?
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        name <- map["name"]
        logoURL <- map["logoURL"]
        message <- map["message"]
    }
}
