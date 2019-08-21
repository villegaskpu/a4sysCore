//
//  ApiError.swift
//  Yopter
//
//  Created by Yoptersys on 4/24/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import ObjectMapper

public class ApiError: Mappable
{
    public var code : String = ""
    public var message : String = ""
    public var cause : String = ""
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
    }
    
    public func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
        cause <- map["cause"]
    }
}
