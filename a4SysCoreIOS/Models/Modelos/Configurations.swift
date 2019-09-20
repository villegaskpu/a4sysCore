//
//  Configurations.swift
//  Yopter Camaleonica
//
//  Created by David on 4/24/19.
//  Copyright © 2019 Yopter. All rights reserved.
//

import ObjectMapper

open class Configurations: Mappable {
    public var customColors:CustomColors = CustomColors()
    public var images: Images = Images()
    public var menu:[Menu] = []
    public var refresh = 0
//    public var tutorialURL = ""
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public init() {
    }
    
    public func mapping(map: Map) {
        customColors <- map["colors"]
        images <- map["images"]
        menu <- map["menu"]
        refresh <- map["refresh"]
//        tutorialURL <- map["tutorialURL"]
    }
}
