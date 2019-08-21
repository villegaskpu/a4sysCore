//
//  ReportReason.swift
//  Yopter
//
//  Created by Yoptersys on 4/25/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import ObjectMapper

open class ReportReason : Mappable
{
    public var idReportReason = 0
    public var name : String = ""
    public var reasonDescription : String = ""
    public var createdAt : String = ""
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
        
    }
    
    public func mapping(map: Map) {
        idReportReason <- map["idReportReason"]
        name <- map["name"]
        reasonDescription <- map["description"]
        createdAt <- map["createdAt"]
    }
}
