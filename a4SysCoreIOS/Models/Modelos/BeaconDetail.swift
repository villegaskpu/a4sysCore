//
//  BeaconDetail.swift
//  Yopter
//
//  Created by Yoptersys on 6/8/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import ObjectMapper

open class BeaconDetail : Mappable
{
    public var idBeacon = 0
    public var beaconType : String =  ""
    public var uuid : String = ""
    public var major = 0
    public var minor = 0
    public var beaconFirmware : BeaconFirmware = BeaconFirmware ()
    public var broadcastingPower = 0
    public var beaconInstallation : BeaconInstallation = BeaconInstallation ()
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
        
    }
    
    public func mapping(map: Map) {
        idBeacon <- map["idBeacon"]
        beaconType <- map["beaconType"]
        uuid <- map["uuid"]
        major <- map["major"]
        minor <- map["minor"]
        beaconFirmware <- map["beaconFirmware"]
        broadcastingPower <- map["broadcastingPower"]
        beaconInstallation <- map["beaconInstallation"]
    }
}
