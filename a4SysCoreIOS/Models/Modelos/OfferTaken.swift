//
//  OfferTaken.swift
//  Yopter
//
//  Created by Yoptersys on 4/25/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import ObjectMapper

open class OfferTaken : Mappable
{
    public var allUsers = 0
    public var mine = 0
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
        
    }
    
    public func mapping(map: Map) {
        allUsers <- map["allUsers"]
        mine <- map["mine"]
    }
}
