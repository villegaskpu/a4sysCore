//
//  WakeUpParser.swift
//  a4SysCoreIOS
//
//  Created by David on 9/5/19.
//  Copyright © 2019 Yopter. All rights reserved.
//

import Foundation
import ObjectMapper

class WakeUpParser: BaseParser {
    
    override func parse(JSONObject: Any) -> AnyObject? {
        if let wake = Mapper<WakeUpResponse>().map(JSONObject: JSONObject) {
            return wake
        }
        return nil
    }
}
