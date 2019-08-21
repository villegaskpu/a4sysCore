//
//  Showed.swift
//  Yopter
//
//  Created by Yoptersys on 6/1/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import ObjectMapper

open class Showed : Mappable
{
    public var idOffer = 0
    public var latitude : Double = 0
    public var longitude : Double = 0
    public var position = 0
    public var page = 0
    public var date : String = ""
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
        
    }
    
    public func mapping(map: Map) {
        idOffer <- map["idOffer"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        position <- map["position"]
        page <- map["page"]
        date <- map["date"]
    }
}
