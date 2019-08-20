//
//  StatisticsResponse.swift
//  Yopter
//
//  Created by Yoptersys on 4/25/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import Foundation
import ObjectMapper

class StatisticsResponse : Mappable
{
    var commerceCount : CommerceCount?
    var offerCount : OfferCount?
    var offerSum : OfferSum?
    var offerTaken : OfferTaken?
    var offerTakenSum : OfferTakenSum?
    var userCount : UserCount?
    var topTaken : [Any]?
    var topRated : [Any]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        commerceCount <- map["commerceCount"]
        offerCount <- map["offerCount"]
        offerSum <- map["offerSum"]
        offerTaken <- map["offerTaken"]
        offerTakenSum <- map["offerTakenSum"]
        userCount <- map["userCount"]
        topTaken <- map["topTaken"]
        topRated <- map["topRated"]
    }
}
