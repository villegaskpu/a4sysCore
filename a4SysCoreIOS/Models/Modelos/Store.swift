//
//  Store.swift
//  Yopter
//
//  Created by Yoptersys on 4/24/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import ObjectMapper

open class Store:  Mappable
{
    
    public var idStore = 0
    public var name: String = ""
    public var addressL1 : String = ""
    public var addressL2 : String = ""
    public var zipCode : String = ""
    public var city : String = ""
    public var state : State = State ()
    public var email : String = ""
    public var latitude : Double = 0
    public var longitude : Double = 0
    public var distance : Double = 0
    public var phoneNumber : String = ""
    public var website : String = ""
    public var imgURL : String = ""
    public var virtualCommerce = 0
    public var mall : Mall = Mall ()
    public var schedules : [Schedule] = []
    public var offers : [Offer] = []
    public var commerce : Commerce = Commerce ()
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
    }
    
    public func mapping(map: Map) {
        idStore <- map["idStore"]
        name <- map["name"]
        addressL1 <- map["addressL1"]
        addressL2 <- map["addressL2"]
        zipCode <- map["zipCode"]
        city <- map["city"]
        state <- map["state"]
        email <- map["email"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        distance <- map["distance"]
        phoneNumber <- map["phoneNumber"]
        website <- map["website"]
        imgURL <- map["imgURL"]
        virtualCommerce <- map["virtualCommerce"]
        mall <- map["mall"]
        schedules <- map["schedules"]
        offers <- map["offers"]
        commerce <- map["commerce"]
    }
}
