//
//  Beacon.swift
//  Yopter
//
//  Created by Yoptersys on 6/7/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import ObjectMapper

open class Beacon : Mappable
{
    public var uuid : String = ""
    public var major = 0
    public var minor = 0
    public var temperature = 0
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
        
    }
    
    public func mapping(map: Map) {
        uuid <- map["uuid"]
        major <- map["major"]
        minor <- map["minor"]
        temperature <- map["temperature"]
    }
}
