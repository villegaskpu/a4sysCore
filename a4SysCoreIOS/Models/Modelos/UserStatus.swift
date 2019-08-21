//
//  UserStatus.swift
//  Yopter
//
//  Created by Yoptersys on 3/30/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import ObjectMapper

open class UserStatus: Mappable
{
    
    public var idUserStatus = 0
    public var name : String = ""
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
        
    }
    
    public func mapping(map: Map) {
        idUserStatus <- map["idUserStatus"]
        name <- map["name"]
    }
}
