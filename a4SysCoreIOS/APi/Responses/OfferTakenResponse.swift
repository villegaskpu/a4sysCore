//
//  offerTakenResponse.swift
//  Yopter
//
//  Created by Juan Carlos Lopez on 17/05/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import Foundation
import ObjectMapper

public class OfferTakenResponse : Mappable
{
    public var takeCode : String?
    public var takeCodeType : TakeCodeType?
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        takeCode <- map["takeCode"]
        takeCodeType <- map["takeCodeType"]
    }
}
