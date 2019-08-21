//
//  Customer.swift
//  Yopter
//
//  Created by Yoptersys on 3/30/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import ObjectMapper

open class Customer: Mappable
{
    
    public var birthday : String = ""
    public var gender : String = ""
    public var idCustomer = 0
    public var name : String = ""
    public var phoneValidated = 0
    public var state : State = State ()
    public var user : User = User ()
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init(){
        
    }
    
    public func mapping(map: Map) {
        idCustomer <- map["idCustomer"]
        name <- map["name"]
        birthday <- map["birthday"]
        gender <- map["gender"]
        user <- map["user"]
        state <- map["state"]
    }
}
