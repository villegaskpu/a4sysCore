//
//  SignUpResponseParse.swift
//  a4SysCoreIOS
//
//  Created by David on 9/17/19.
//  Copyright © 2019 Yopter. All rights reserved.
//

import Foundation
import ObjectMapper

class SignUpResponseParser: BaseParser {
    
    override func parse(JSONObject: Any) -> AnyObject? {
        if let wake = Mapper<SignUpResponse>().map(JSONObject: JSONObject) {
            return wake
        }
        return nil
    }
}



