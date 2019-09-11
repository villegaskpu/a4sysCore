//
//  OfferTakenResponseParse.swift
//  a4SysCoreIOS
//
//  Created by David on 9/11/19.
//  Copyright © 2019 Yopter. All rights reserved.
//

import Foundation
import ObjectMapper

class OffertTakenResponseParse: BaseParser {
    
    
    override func parse(JSONObject: Any) -> AnyObject? {
        if let loginResponse = Mapper<OfferTakenResponse>().map(JSONObject: JSONObject) {
            return loginResponse
        }
        return nil
    }
}
