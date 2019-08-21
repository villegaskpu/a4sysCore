//
//  TakeCodeType.swift
//  Yopter
//
//  Created by Juan Carlos Lopez on 17/05/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import ObjectMapper

open class TakeCodeType : Mappable
{
    public var idTakeCodeType = 0
    public var name : String = ""
    public var status : String = ""
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
        
    }
    
    public func mapping(map: Map) {
        idTakeCodeType <- map["idTakeCodeType"]
        name <- map["name"]
        status <- map["status"]
    }
}
