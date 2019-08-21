//
//  ExternalInfo.swift
//  Yopter
//
//  Created by Yoptersys on 4/19/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import ObjectMapper

open class ExternalInfo: Mappable
{
    public var idExternal : String = ""
    public var santanderProduct : SantanderProduct = SantanderProduct ()
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        idExternal <- map["idExternal"]
        santanderProduct <- map["santanderProduct"]
    }
}

