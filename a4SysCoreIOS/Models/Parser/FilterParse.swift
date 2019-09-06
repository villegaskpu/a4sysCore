//
//  FilterParse.swift
//  a4SysCoreIOS
//
//  Created by David on 9/5/19.
//  Copyright © 2019 Yopter. All rights reserved.
//

import UIKit
import ObjectMapper

class FilterParse: BaseParser {
    override func parse(JSONObject: Any) -> AnyObject? {
        
        if let value = Mapper<FiltersCategories>().mapArray(JSONObject: JSONObject) {
            return value as AnyObject
        }
        return nil
    }
}
