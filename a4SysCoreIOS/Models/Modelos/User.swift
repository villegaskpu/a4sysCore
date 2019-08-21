//
//  User.swift
//  Yopter
//
//  Created by Yoptersys on 3/30/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import ObjectMapper

open class User: Mappable
{
    public var idUser = 0
    public var email : String = ""
    public var banned = 0
    public var userStatus: UserStatus = UserStatus ()
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
    }
    
    public func mapping(map: Map) {
        idUser <- map["idUser"]
        email <- map["email"]
        banned <- map["banned"]
        userStatus <- map["userStatus"]
    }
}
