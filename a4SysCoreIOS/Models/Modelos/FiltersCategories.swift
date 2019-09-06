//
//  FiltersCategories.swift
//  mi2
//
//  Created by David on 7/12/19.
//  Copyright © 2019 Yopter. All rights reserved.
//

import Foundation
import ObjectMapper

public class FiltersCategories : Mappable
{
    public var idCategoryAlias : Int?
    public var name : String?
    public var iconUrl: String?
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        idCategoryAlias <- map["idCategoryAlias"]
        name <- map["name"]
        iconUrl <- map["iconUrl"]
    }
}
