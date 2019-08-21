//
//  OfferTakenSum.swift
//  Yopter
//
//  Created by Yoptersys on 4/25/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import ObjectMapper

open class OfferTakenSum : Mappable
{
    public var sumAllUsers = 0
    public var sumMine = 0
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
        
    }
    
    public func mapping(map: Map) {
        sumAllUsers <- map["sumAllUsers"]
        sumMine <- map["sumMine"]
    }
}
