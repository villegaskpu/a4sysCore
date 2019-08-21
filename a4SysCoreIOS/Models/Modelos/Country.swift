//
//  Country.swift
//  Yopter
//
//  Created by Yoptersys on 3/30/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import ObjectMapper

open class Country: Mappable
{
    public var idCountry = 0
    public var name : String = ""
    public var isoCode2 : String = ""
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
    }
    
    public func mapping(map: Map) {
        idCountry <- map["idCountry"]
        name <- map["name"]
        isoCode2 <- map["isoCode2"]
    }
}
