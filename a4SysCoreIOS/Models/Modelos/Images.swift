//
//  Images.swift
//  Yopter Camaleonica
//
//  Created by David on 4/24/19.
//  Copyright © 2019 Yopter. All rights reserved.
//

import ObjectMapper

open class Images: Mappable
{
    public var headerURL : String = ""
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
    }
    
    public func mapping(map: Map) {
        headerURL <- map["headerURL"]
    }
}
