//
//  ReportSucursal.swift
//  Yopter
//
//  Created by Yopter Big Data on 14/09/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import ObjectMapper

open class ReportSucursal : Mappable
{
    public var idReportSucursal = 0
    public var name : String = ""
    public var reasonDescription : String = ""
    public var createdAt : String = ""
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
        
    }
    
    public func mapping(map: Map) {
        idReportSucursal <- map["idReportSucursal"]
        name <- map["name"]
        reasonDescription <- map["description"]
        createdAt <- map["createdAt"]
    }
}

