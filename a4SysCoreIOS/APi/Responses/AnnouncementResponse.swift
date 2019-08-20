//
//  AnnouncementResponse.swift
//  Yopter
//
//  Created by Yoptersys on 6/8/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import ObjectMapper

class AnnouncementResponse : Mappable
{
    var beacon : BeaconDetail?
    var offer : Offer?
    var contactTime = 0
    var gender : String?
    var ageMin = 0
    var ageMax = 0
    
    var notify = false
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        beacon <- map["beacon"]
        offer <- map["offer"]
        contactTime <- map["contactTime"]
        gender <- map["gender"]
        ageMin <- map["ageMin"]
        ageMax <- map["ageMax"]
        notify <- map["notify"]
    }
}

