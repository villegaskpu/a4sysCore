//
//  Geofence.swift
//  Yopter
//
//  Created by Victor Hernandez on 2/18/18.
//  Copyright © 2018 Yopter. All rights reserved.
//

import Foundation
import ObjectMapper


open class Geofence: Mappable
{
    public var name: String = ""
    public var location : LocationGeofence = LocationGeofence()
    public var radio : Double = 0
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
        
    }
    
    public func mapping(map: Map) {
        name <- map["name"]
        location <- map["location"]
        radio <- map["radio"]
    }
}
