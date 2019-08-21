//
//  State.swift
//  Yopter
//
//  Created by Yoptersys on 3/30/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import ObjectMapper

open class State: Mappable
{
    public var country : Country = Country ()
    public var idState = 0
    public var name : String = ""
    public var abbreviation : String = ""
    public var active = 0
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
        
    }
    
    public func mapping(map: Map) {
        country <- map["country"]
        idState <- map["idState"]
        name <- map["name"]
        abbreviation <- map["abbreviation"]
        active <- map["active"]
    }
}













