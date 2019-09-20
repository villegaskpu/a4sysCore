//
//  ConfigurationsParser.swift
//  a4SysCoreIOS
//
//  Created by David on 9/18/19.
//  Copyright © 2019 Yopter. All rights reserved.
//

import Foundation
import ObjectMapper

class ConfigurationsParser:BaseParser {
    
    override func parse(JSONObject: Any) -> AnyObject? {
        if let wake = Mapper<Configurations>().map(JSONObject: JSONObject) {
            return wake
        }
        return nil
    }
}

