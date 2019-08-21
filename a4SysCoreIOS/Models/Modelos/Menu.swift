//
//  menu.swift
//  Yopter Camaleonica
//
//  Created by David on 4/24/19.
//  Copyright © 2019 Yopter. All rights reserved.
//

import ObjectMapper

open class Menu: Mappable {
    
    public var action:Action = Action ()
    public var iconURL = ""
    public var name = ""
    public var order = 0
    
    
    required public  convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
    }
    
    public func mapping(map: Map) {
        action <- map["action"]
        iconURL <- map["iconURL"]
        name <- map["name"]
        order <- map["order"]
    }
}

open class Action: Mappable {
    public var URL = ""
    public var type = 0
    public var webView:Int = 90
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
    }
    
    public func mapping(map: Map) {
        URL <- map["URL"]
        type <- map["type"]
        webView <- map["webView"]
    }
}
