//
//  SugestParse.swift
//  a4SysCoreIOS
//
//  Created by David on 9/12/19.
//  Copyright © 2019 Yopter. All rights reserved.
//

import Foundation
import ObjectMapper

class Sugest:BaseParser {
    override func parse(JSONObject: Any) -> AnyObject? {
        
        print("JSONObject: \(JSONObject)")
        
//        if let value = Mapper<String>().mapArray(JSONObject: JSONObject) {
//            print("valor: \(value)")
//            return value as AnyObject
//        }
        return nil
    }
}
