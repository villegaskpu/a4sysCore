//
//  offerTakenResponse.swift
//  Yopter
//
//  Created by Juan Carlos Lopez on 17/05/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import Foundation
import ObjectMapper

class OfferTakenResponse : Mappable
{
    var takeCode : String?
    var takeCodeType : TakeCodeType?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        takeCode <- map["takeCode"]
        takeCodeType <- map["takeCodeType"]
    }
}
