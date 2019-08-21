//
//  OfferStatus.swift
//  Yopter
//
//  Created by Yoptersys on 4/24/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import ObjectMapper

open class OfferStatus: Mappable
{
    
    public var idOfferStatus = 0
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
    }
    
    public func mapping(map: Map) {
        idOfferStatus <- map["idOfferStatus"]
    }
}
