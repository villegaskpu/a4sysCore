//
//  Network.swift
//  a4SysCoreIOS
//
//  Created by David on 8/8/19.
//  Copyright © 2019 Yopter. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper



private class NetworkManager {
    static let sessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        
        return SessionManager(configuration: configuration)
    }()
}

open class Network: NSObject {
    
    
    private var urlParameters:[String:Any]?
    private var parser: BaseParser?
    
    public func setUrlParameters(urlParameters:[String:Any]) {
        self.urlParameters = urlParameters
    }
    
    private func set(parser: BaseParser) {
        self.parser = parser
    }
    
    private func callService(_ url : URLRequestConvertible, parser:BaseParser, _ respuesta : @escaping (_ statusCode: String, _ value: Any, _ objeto:AnyObject?) ->(Void)) {
        let sessionManager = NetworkManager.sessionManager
        set(parser: parser)
        sessionManager.request(url).responseJSON{ (response) in
            
            let statusCode = response.response?.statusCode ?? 0            
            switch(response.result)
            {
            case .success(let value):
                
                print("exito: \(value)  statuscCode: \(String(describing: response.response?.statusCode))")
                
                if statusCode >= 200 && statusCode < 300 {
                    let obj = self.parser?.parse(JSONObject: value)
                    respuesta("\(statusCode)", value, obj as AnyObject)
                } else {
                    let obj = self.parseError(JSONObject: value)
                    respuesta("\(statusCode)", value, obj as AnyObject)
                }
            case .failure(let value):
                print("fallo")
                let obj = self.parseError(JSONObject: value)
                respuesta("\(statusCode)", value, obj as AnyObject)
                break
            }
        }
    }
    
    private func parseError(JSONObject: Any) -> AnyObject? {
        if let apiError = Mapper<ApiError>().map(JSONObject: JSONObject) {
            return apiError
        }
        return nil
    }

    // Mark: Login user
    public func endPointN(endPont: endPoint, _ callback: @escaping(_ statusCode: String, _ value: Any, _ objeto:AnyObject?) -> (Void)) {
        var urll: URLRequestConvertible?
        var parserB = BaseParser()
        switch endPont {
        case .Login:
            urll = YopterRouter.Login(parameter: self.urlParameters!)
            parserB = LoginParser()
            break
        case .GetHome:
            urll = YopterRouter.GetHome(parameter: self.urlParameters!)
            parserB = HomeParser()
            break
        case .OfferSearch:
            urll = YopterRouter.OfferSearch(parameter: self.urlParameters!)
            parserB = HomeParser()
            break
        default:
            break
        }
        
        callService(urll!,parser: parserB){ response,value, objeto  in
            _ = callback(response, value, objeto)
        }
    }
}
