//
//  Commerce.swift
//  Yopter
//
//  Created by Yoptersys on 4/24/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import ObjectMapper

open class Commerce: Mappable
{
    
    public var idCommerce = 0
    public var name : String = ""
    public var taxReferenceId : String = ""
    public var logoURL : String = ""
    public var s3LogoURL : String = ""
    public var website : String = ""
    public var signDate : String = ""
    public var stores : [Store] = []
    public var keywords : [Keyword] = []
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init(){
    }
    
    public func mapping(map: Map) {
        idCommerce <- map["idCommerce"]
        name <- map["name"]
        taxReferenceId <- map["taxReferenceId"]
        logoURL <- map["logoURL"]
        s3LogoURL <- map["s3LogoURL"]
        website <- map["website"]
        signDate <- map["signDate"]
        stores <- map["stores"]
        keywords <- map["keywords"]
    }
}
