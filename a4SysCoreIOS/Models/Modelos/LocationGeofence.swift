//
//  LocationGeofence.swift
//  Yopter
//
//  Created by Victor Hernandez on 2/18/18.
//  Copyright © 2018 Yopter. All rights reserved.
//

import Foundation
import ObjectMapper

open class LocationGeofence: Mappable{
    public var latitude : Double = 0
    public var longitude : Double = 0
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
    }
    
    public func mapping(map: Map) {
        latitude <- map["latitude"]
        longitude <- map["longitude"]
    }
}
