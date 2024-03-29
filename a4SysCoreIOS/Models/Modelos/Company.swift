//
//  Companies.swift
//  Yopter Camaleonica
//
//  Created by David on 4/30/19.
//  Copyright © 2019 Yopter. All rights reserved.
//

import ObjectMapper

open class Company: Mappable {
    
    public var idCompany = 0
    public var name = ""
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
    }
    
    public func mapping(map: Map) {
        idCompany <- map["idCompany"]
        name <- map["name"]
    }
}
