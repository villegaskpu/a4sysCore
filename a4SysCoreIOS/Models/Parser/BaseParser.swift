//
//  BaseParser.swift
//  a4SysCoreIOS
//
//  Created by David on 8/20/19.
//  Copyright © 2019 Yopter. All rights reserved.
//

import Foundation
import ObjectMapper


class BaseParser: NSObject {
    
    var objeto: AnyObject?
    override init() {
        super.init()
    }
    
    func parse(json : String) -> AnyObject? {
        return objeto as AnyObject
    }
}
