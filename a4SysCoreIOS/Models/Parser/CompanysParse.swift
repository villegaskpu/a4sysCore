//
//  CompanysParse.swift
//  a4SysCoreIOS
//
//  Created by David on 9/17/19.
//  Copyright © 2019 Yopter. All rights reserved.
//

import Foundation
import ObjectMapper

class CompanysParser:BaseParser {
    override func parse(JSONObject: Any) -> AnyObject? {
        
        if let value = Mapper<Company>().mapArray(JSONObject: JSONObject) {
            return value as AnyObject
        }
        return nil
    }
}
