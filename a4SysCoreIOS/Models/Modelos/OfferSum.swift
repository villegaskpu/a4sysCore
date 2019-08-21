//
//  OfferSum.swift
//  Yopter
//
//  Created by Yoptersys on 4/25/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import ObjectMapper

class OfferSum : Mappable
{
    public var sum = 0
    public var categories : [Category] = []
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
    }
    
    public func mapping(map: Map) {
        sum <- map["sum"]
        categories <- map["categories"]
    }
}
