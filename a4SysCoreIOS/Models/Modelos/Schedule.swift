//
//  Schedule.swift
//  Yopter
//
//  Created by Yoptersys on 4/24/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import ObjectMapper

open class Schedule: Mappable
{
    
    public var idSchedule = 0
    public var weekdays : String = ""
    public var openAt : String = ""
    public var closedAt : String = ""
    public var createdAt : String = ""
    public var updatedAt : String = ""
    public var breakTimeStart : String = ""
    public var breakTimeEnd : String = ""
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
        
    }
    
    public func mapping(map: Map) {
        idSchedule <- map["idSchedule"]
        weekdays <- map["weekdays"]
        openAt <- map["openAt"]
        closedAt <- map["closedAt"]
        createdAt <- map["createdAt"]
        updatedAt <- map["updatedAt"]
        breakTimeStart <- map["breakTimeStart"]
        breakTimeEnd <- map["breakTimeEnd"]
    }
}
