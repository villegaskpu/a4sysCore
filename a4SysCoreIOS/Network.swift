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
    
    private func callService(_ url : URLRequestConvertible, _ respuesta : @escaping (_ statusCode: Int, _ value: Any, _ objeto:AnyObject?) ->(Void)) {
        let sessionManager = NetworkManager.sessionManager
        
        sessionManager.request(url).responseJSON{ (response) in
            
            let statusCode = response.response?.statusCode ?? 0
//            print("Es el error : \(errRes) ....  \(ddd)")
            switch(response.result)
            {
            case .success(let value):
                
                print("exito: \(value)  statuscCode: \(String(describing: response.response?.statusCode))")
                let jsonError = String(data: response.data!, encoding: .utf8)
//                let apiError = Mapper<ApiError>().map(JSONString: jsonError!)
//                let err = apiError?.message ?? "UNNATENDED_ERROR".localized
                
                let par = self.parser?.parse(json: jsonError ?? "")
                respuesta(statusCode, value, par)
            case .failure(let value):
                print("fallo")
//                print("jsonerror = \(response.error)")
//                print("jsonerror = \(response.description)")
                let jsonError = String(data: response.data!, encoding: .utf8)
                let apiError = Mapper<ApiError>().map(JSONString: jsonError!)
                let err = apiError?.message ?? "UNNATENDED_ERROR".localized
                print("a4syserror:\(response.error)")
                print("a4syserror:\(response.description)")
                print("a4syserror:\(response.value)")
                respuesta(statusCode, value, err as AnyObject)
                break
            }
        }
    }
    
    // Mark: Login user
    public func endPointN(endPont: endPoint, _ callback: @escaping(_ statusCode: Int, _ value: Any, _ objeto:AnyObject?) -> (Void)) {
        var urll: URLRequestConvertible?
        
        switch endPont {
        case .Login:
            urll = YopterRouter.Login(parameter: self.urlParameters!)
            break
        default:
            break
        }
        
        callService(urll!){ response,value, objeto  in
            _ = callback(response, value, objeto)
        }
    }
}
