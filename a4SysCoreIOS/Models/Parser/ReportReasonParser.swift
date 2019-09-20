//
//  ReportReasonParser.swift
//  a4SysCoreIOS
//
//  Created by David on 9/12/19.
//  Copyright © 2019 Yopter. All rights reserved.
//

import Foundation
import ObjectMapper

class ReporReasonParser: BaseParser {
    override func parse(JSONObject: Any) -> AnyObject? {
    
    if let value = Mapper<ReportReason>().mapArray(JSONObject: JSONObject) {
        return value as AnyObject
    }
    return nil
    }
}

