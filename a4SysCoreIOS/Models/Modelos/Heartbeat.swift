//
//  Heartbeat.swift
//  Yopter
//
//  Created by Yoptersys on 6/6/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import ObjectMapper

open class Heartbeat : Mappable
{
    public var latitude : Double = 0
    public var longitude : Double = 0
    public var beatAt : String = ""
    
    required public  convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
        
    }
    
    public func mapping(map: Map) {
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        beatAt <- map["beatAt"]
    }
}

