//
//  BeaconInstallation.swift
//  Yopter
//
//  Created by Yoptersys on 6/8/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import ObjectMapper

open class BeaconInstallation : Mappable
{
    public var store : Store = Store ()
    public var radio = 0
    public var forcePush = 0
    public var beaconInstallationType : BeaconInstallationType = BeaconInstallationType ()
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
    }
    
    public func mapping(map: Map) {
        store <- map["store"]
        radio <- map["radio"]
        forcePush <- map["forcePush"]
        beaconInstallationType <- map["beaconInstallationType"]
    }
}
