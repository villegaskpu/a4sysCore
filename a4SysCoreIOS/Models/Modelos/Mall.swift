//
//  Mall.swift
//  Yopter
//
//  Created by Yopter Big Data on 21/06/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import ObjectMapper

open class Mall : Mappable
{
    public var idMall = 0
    public var name : String = ""
    public var zoneImg : [ZoneImg] = []
    public var logoURL : String = ""
    public var countStore = 0
    public var countOffer = 0
    public var estimatedSavingsOffers = 0
    public var notify : String = ""
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
        
    }
    
    public func mapping(map: Map) {
        idMall <- map["idMall"]
        name <- map["name"]
        zoneImg <- map["zoneImg"]
        logoURL <- map["logoURL"]
        countStore <- map["countStore"]
        countOffer <- map["countOffer"]
        estimatedSavingsOffers <- map["estimatedSavingsOffers"]
        notify <- map["notify"]
    }
}
