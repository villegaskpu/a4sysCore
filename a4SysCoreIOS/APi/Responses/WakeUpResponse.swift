//
//  WakeUpResponse.swift
//  Yopter
//
//  Created by Yoptersys on 4/25/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import Foundation
import ObjectMapper

class WakeUpResponse : Mappable
{
    var androidVersion : String?
    var iOSVersion : String?
    var mall : Mall?
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        androidVersion <- map["androidVersion"]
        iOSVersion <- map["iOSVersion"]
        mall <- map["mall"]
    }
}
