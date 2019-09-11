//
//  ArticulosParse.swift
//  a4SysCoreIOS
//
//  Created by David on 9/9/19.
//  Copyright © 2019 Yopter. All rights reserved.
//

import Foundation
import ObjectMapper

class ArticulosParse : BaseParser {
    override func parse(JSONObject: Any) -> AnyObject? {
        
        if let value = Mapper<Article>().mapArray(JSONObject: JSONObject) {
            
            var tempArrOffers : [Offer] = []
            for item in value {
                if item.rating.rating != 1.0 {
                    tempArrOffers.append(Offer.init(article: item)!)
                }
            }
            
            tempArrOffers = tempArrOffers.map{ (offer : Offer) -> Offer in
                let mutableOffer = offer
                mutableOffer.isHome = false
                mutableOffer.isFavorite = false
                mutableOffer.isArticle = true
                return mutableOffer
            }
            return tempArrOffers as AnyObject
        }
        
        return nil
    }
}
