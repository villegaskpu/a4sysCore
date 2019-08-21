//
//  Article.swift
//  Push
//
//  Created by Victor Hernandez on 8/3/18.
//  Copyright © 2018 Yopter. All rights reserved.
//

import ObjectMapper

open class Article : Mappable{
    public var idArticle = 0
    public var title : String = ""
    public var articleDescription : String = ""
    public var websiteURL : String = ""
    public var images : [Image] = []
    public var permanent = 0
    public var offerStatus : OfferStatus = OfferStatus ()
    public var viewed = 0
    public var favorite = 0
    public var rating : Rating =  Rating ()
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
    }
    
    public func mapping(map: Map) {
        idArticle <- map["idArticle"]
        title <- map["title"]
        articleDescription <- map["description"]
        websiteURL <- map["websiteURL"]
        permanent <- map["permanent"]
        offerStatus <- map["offerStatus"]
        images <- map["images"]
        viewed <- map["viewed"]
        favorite <- map["favorite"]
        rating <- map["rating"]
    }
}
