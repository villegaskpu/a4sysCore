//
//  SantanderProduct.swift
//  Yopter
//
//  Created by Yoptersys on 4/19/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import ObjectMapper

open class SantanderProduct: Mappable
{
    public var idCode : String = ""
    public var idProduct = 0
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
    }
    
    public func mapping(map: Map) {
        idCode <- map["idCode"]
        idProduct <- map["idProduct"]
    }
}
