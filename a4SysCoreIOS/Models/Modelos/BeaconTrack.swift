//
//  BeaconTrack.swift
//  Yopter
//
//  Created by Yoptersys on 6/6/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import ObjectMapper

open class BeaconTrack : Mappable
{
    public var beacon : Beacon = Beacon ()
    public var enterDate : String = ""
    public var exitDate : String = ""
    public var proximity : String = ""
    public var minDistance = 0
    public var maxDistance = 0
    public var date : String = ""
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    init() {
    }
    
    public func mapping(map: Map) {
        beacon <- map["beacon"]
        enterDate <- map["enterDate"]
        exitDate <- map["exitDate"]
        proximity <- map["proximity"]
        minDistance <- map["minDistance"]
        maxDistance <- map["maxDistance"]
        date <- map["date"]
    }
}
