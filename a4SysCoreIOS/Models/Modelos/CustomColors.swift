//
//  CustomColors.swift
//  Yopter Camaleonica
//
//  Created by David on 4/23/19.
//  Copyright © 2019 Yopter. All rights reserved.
//

import Foundation
import ObjectMapper

open class CustomColors: Mappable {
    
    public var background = ""
    public var footer = ""
    public var header = ""
    public var titleBackground = ""
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
    }
    
    public func mapping(map: Map) {
        background <- map["background"]
        footer <- map["footer"]
        header <- map["header"]
        titleBackground <- map["titleBackground"]
    }
}
