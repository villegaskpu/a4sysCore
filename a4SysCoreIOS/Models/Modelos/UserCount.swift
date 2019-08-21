//
//  UserCount.swift
//  Yopter
//
//  Created by Yoptersys on 4/25/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import ObjectMapper

open class UserCount : Mappable
{
    public var count = 0
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
    }
    
    public func mapping(map: Map) {
        count <- map["count"]
    }
}
