//
//  HomeParser.swift
//  a4SysCoreIOS
//
//  Created by David on 8/22/19.
//  Copyright © 2019 Yopter. All rights reserved.
//

import Foundation
import ObjectMapper

class HomeParser: BaseParser {
    override func parse(JSONObject: Any) -> AnyObject? {
        
        if let value = Mapper<Offer>().mapArray(JSONObject: JSONObject) {
            var tempArrOffers : [Offer] = []
            for item in value {
                if item.userRating.rating != 1.0 {
                    tempArrOffers.append(item)
                }
            }
            tempArrOffers = tempArrOffers.filter{ $0.deleted == 0 }
            tempArrOffers = tempArrOffers.map{ (offer : Offer) -> Offer in
                let mutableOffer = offer
                mutableOffer.isHome = true
                mutableOffer.isFavorite = false
                return mutableOffer
            }
            
            return value as AnyObject
        }
        
        return nil
        
    }
}
