//
//  ShowPushNotiResponse.swift
//  Televisa Comunica
//
//  Created by Cristopher Pelayo on 8/31/18.
//  Copyright © 2018 Yopter. All rights reserved.
//

import ObjectMapper

class ShowPushNotiResponse: Mappable {
    
    var showIt : Bool = false
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        showIt <- map["showIt"]
    }
    
}
