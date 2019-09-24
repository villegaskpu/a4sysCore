//
//  WhoAmIParse.swift
//  a4SysCoreIOS
//
//  Created by David on 9/23/19.
//  Copyright © 2019 Yopter. All rights reserved.
//

import Foundation
import ObjectMapper

class WhoAmiParse:BaseParser {
    
    override func parse(JSONObject: Any) -> AnyObject? {
        if let wake = Mapper<WhoAmI>().map(JSONObject: JSONObject) {
            return wake
        }
        return nil
    }
}
