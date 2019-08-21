//
//  Offer.swift
//  Yopter
//
//  Created by Yoptersys on 4/24/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import ObjectMapper

open class Offer: Mappable
{
    
    public var idOffer = 0
    public var title : String = ""
    public var offerDescription : String = ""
    public var conditions : String = ""
    public var websiteURL: String = ""
    public var virtual = 0
    public var images : [Image] = []
    public var offerType : OfferType = OfferType ()
    public var customerRequired = 0
    public var permanent = 0
    public var offerStatus : OfferStatus = OfferStatus ()
    public var keywords : [Keyword] = []
    public var categories : [Category] = []
    public var commerce : Commerce = Commerce ()
    public var viewed = 0
    public var deleted = 0
    public var favorite = 0
    public var rating : Rating = Rating ()
    public var userRating : UserRating = UserRating ()
    public var createdAt : String = ""
    public var endDate : String = ""
    public var isHome = false
    public var isFavorite = false
    public var isArticle = false
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
        
    }
    
    convenience public init?(article: Article)
    {
        self.init()
        idOffer = article.idArticle
        title = article.title
        offerDescription = article.articleDescription
        websiteURL = article.websiteURL
        images = article.images
        permanent = article.permanent
        offerStatus = article.offerStatus
        viewed = article.viewed
        favorite = article.favorite
        rating = article.rating
    }
    
    public func mapping(map: Map) {
        idOffer <- map["idOffer"]
        title <- map["title"]
        offerDescription <- map["description"]
        conditions <- map["conditions"]
        websiteURL <- map["websiteURL"]
        virtual <- map["virtual"]
        images <- map["images"]
        offerType <- map["offerType"]
        customerRequired <- map["customerRequired"]
        permanent <- map["permanent"]
        endDate <- map["endDate"]
        offerStatus <- map["offerStatus"]
        keywords <- map["keywords"]
        categories <- map["categories"]
        commerce <- map["commerce"]
        viewed <- map["viewed"]
        deleted <- map["deleted"]
        rating <- map["rating"]
        userRating <- map["userRating"]
        createdAt <- map["createdAt"]
        favorite <- map["favorite"]
    }
}
