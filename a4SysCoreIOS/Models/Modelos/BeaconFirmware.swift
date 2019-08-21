//
//  BeaconFirmware.swift
//  Yopter
//
//  Created by Yoptersys on 6/8/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import ObjectMapper

open class BeaconFirmware : Mappable
{
    public var idBeaconFirmware = 0
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
        
    }
    
    public func mapping(map: Map) {
        idBeaconFirmware <- map["idBeaconFirmware"]
    }
}
