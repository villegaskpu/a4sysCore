//
//  LoginParser.swift
//  a4SysCoreIOS
//
//  Created by David on 8/20/19.
//  Copyright © 2019 Yopter. All rights reserved.
//

import Foundation
import ObjectMapper

class LoginParser: BaseParser {
    
    
    override func parse(JSONObject: Any) -> AnyObject? {
        if let loginResponse = Mapper<LoginResponse>().map(JSONObject: JSONObject) {
            return loginResponse
        }
        
        return nil
    }
}
