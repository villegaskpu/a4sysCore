//
//  BeaconInstallationType.swift
//  Yopter
//
//  Created by Yoptersys on 6/8/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import ObjectMapper

open class BeaconInstallationType :Mappable
{
    public var idBeaconInstallationType = 0
    public var name : String = ""
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
        
    }
    
    public func mapping(map: Map) {
        idBeaconInstallationType <- map["idBeaconInstallationType"]
        name <- map["name"]
    }
}
