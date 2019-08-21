//
//  ArticlesResponse.swift
//  Push
//
//  Created by Victor Hernandez on 8/3/18.
//  Copyright © 2018 Yopter. All rights reserved.
//

import ObjectMapper

class ArticlesResponse : Mappable{
    public var draw : Int = 0
    public var recordsTotal : Int = 0
    public var recordsFiltered : Int = 0
    public var data : [Article] = []
    
    required public init?(map: Map) { }
    
    public init() {
        
    }
    
    public func mapping(map: Map) {
        draw <- map["draw"]
        recordsTotal <- map["recordsTotal"]
        recordsFiltered <- map["recordsFiltered"]
        data <- map["data"]
    }
}
