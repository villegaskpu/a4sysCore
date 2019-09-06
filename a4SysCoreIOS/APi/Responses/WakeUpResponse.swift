//
//  WakeUpResponse.swift
//  Yopter
//
//  Created by Yoptersys on 4/25/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import Foundation
import ObjectMapper

public class WakeUpResponse : Mappable
{
    public var androidVersion : String?
    public var iOSVersion : String?
    public var mall : Mall?
    
    public required init?(map: Map) { }
    
    public func mapping(map: Map) {
        androidVersion <- map["androidVersion"]
        iOSVersion <- map["iOSVersion"]
        mall <- map["mall"]
    }
}
