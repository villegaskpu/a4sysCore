//
//  Rating.swift
//  Yopter
//
//  Created by Yoptersys on 4/24/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import ObjectMapper

open class Rating: Mappable
{
    public var rating : Double = 0
    public var count = 0
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
        
    }
    
    public func mapping(map: Map) {
        rating <- map["rating"]
        count <- map["count"]
    }
}
