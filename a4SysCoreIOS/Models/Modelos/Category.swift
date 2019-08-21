//
//  Category.swift
//  Yopter
//
//  Created by Yoptersys on 4/24/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import ObjectMapper

open class Category: Mappable
{
    public var idCategory = 0
    public var name : String = ""
    public var idParentCategory = 0
    public var imgURL : String = ""
    public var iconURL : String = ""
    public var iconUnicode : String = ""
    public var categories : [Category] = []
    public var offerCount = 0
    public var sum = 0
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
    }
    
    public func mapping(map: Map) {
        idCategory <- map["idCategory"]
        name <- map["name"]
        idParentCategory <- map["idParentCategory"]
        imgURL <- map["imgURL"]
        iconURL <- map["iconURL"]
        iconUnicode <- map["iconUnicode"]
        categories <- map["categories"]
        offerCount <- map["offerCount"]
        sum <- map["sum"]
    }
}
