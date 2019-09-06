//
//  Enviroment.swift
//  a4SysCoreIOS
//
//  Created by David on 9/4/19.
//  Copyright © 2019 Yopter. All rights reserved.
//

import Foundation


public enum Environment {
    case pro
    case pre
    case test
}

class WebService: NSObject {
    static var baseURLString = ""
    static var newBaseURLString = ""
    
     static func setup() {
        switch ENVIRONMENTFRAME {
        case .pro:
            baseURLString = "https://fyf5tabava.execute-api.us-east-1.amazonaws.com/pro"
            newBaseURLString = "https://tms93ofcxe.execute-api.us-east-1.amazonaws.com/pro"
        case .pre:
            baseURLString = "https://fyf5tabava.execute-api.us-east-1.amazonaws.com/pre"
            newBaseURLString = "https://tms93ofcxe.execute-api.us-east-1.amazonaws.com/pre"
        case .test:
            baseURLString = "https://fyf5tabava.execute-api.us-east-1.amazonaws.com/test"
            newBaseURLString = "https://tms93ofcxe.execute-api.us-east-1.amazonaws.com/test"
        }
    }
}
