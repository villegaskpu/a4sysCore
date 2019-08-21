//
//  Image.swift
//  Yopter
//
//  Created by Yoptersys on 4/24/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import ObjectMapper

open class Image: Mappable
{
    public var imageURL : String = ""
    public var s3URL : String = ""
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
    }
    
    public func mapping(map: Map) {
        imageURL <- map["imageURL"]
        s3URL <- map["s3URL"]
    }
}
