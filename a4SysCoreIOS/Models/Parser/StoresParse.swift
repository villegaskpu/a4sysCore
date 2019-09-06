//
//  StoresParse.swift
//  a4SysCoreIOS
//
//  Created by David on 9/5/19.
//  Copyright © 2019 Yopter. All rights reserved.
//

import Foundation
import ObjectMapper

class StoresParse: BaseParser {
    override func parse(JSONObject: Any) -> AnyObject? {
        
        if let value = Mapper<Store>().mapArray(JSONObject: JSONObject) {
            return value as AnyObject
        }
        return nil
    }
}
