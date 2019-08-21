//
//  RealmString.swift
//  Yopter
//
//  Created by Yopter Big Data on 21/06/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import ObjectMapper

open class ZoneImg : Mappable
{
    public var idMall = 0
    public var name : String = ""
    public var urlImg : String = ""
    public var idmallZoneImg = 0
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
        
    }
    
    public func mapping(map: Map) {
        idMall <- map["idMall"]
        name <- map["name"]
        urlImg <- map["urlImg"]
        idmallZoneImg <- map["idmallZoneImg"]
    }
}

