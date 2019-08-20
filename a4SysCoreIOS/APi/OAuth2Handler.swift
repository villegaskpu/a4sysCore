//
//  OAuth2Handler.swift
//  Yopter
//
//  Created by Yoptersys on 3/30/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import Foundation
import Alamofire
//import FBSDKCoreKit
//import FBSDKLoginKit

class OAuth2Handler: RequestAdapter, RequestRetrier{
    private typealias RefreshCompletion = (_ succeeded: Bool, _ accessToken: String?, _ oldAccessToken: String?) -> Void
    
    
    let defaultHTTPHeaders: HTTPHeaders = {
        // Accept-Encoding HTTP Header; see https://tools.ietf.org/html/rfc7230#section-4.2.3
        let acceptEncoding: String = "gzip;q=1.0, compress;q=0.5"
        
        // Accept-Language HTTP Header; see https://tools.ietf.org/html/rfc7231#section-5.3.5
        let acceptLanguage = Locale.preferredLanguages.prefix(6).enumerated().map { index, languageCode in
            let quality = 1.0 - (Double(index) * 0.1)
            return "\(languageCode);q=\(quality)"
            }.joined(separator: ", ")
        
        // User-Agent Header; see https://tools.ietf.org/html/rfc7231#section-5.5.3
        // Example: `iOS Example/1.0 (org.alamofire.iOS-Example; build:1; iOS 10.0.0) Alamofire/4.0.0`
        let userAgent: String = {
            if let info = Bundle.main.infoDictionary {
                let executable = info[kCFBundleExecutableKey as String] as? String ?? "Unknown"
                let bundle = info[kCFBundleIdentifierKey as String] as? String ?? "Unknown"
                let appVersion = info["CFBundleShortVersionString"] as? String ?? "Unknown"
                let appBuild = info[kCFBundleVersionKey as String] as? String ?? "Unknown"
                
                let osNameVersion: String = {
                    let version = ProcessInfo.processInfo.operatingSystemVersion
                    let versionString = "\(version.majorVersion).\(version.minorVersion).\(version.patchVersion)"
                    
                    let osName: String = {
                        #if os(iOS)
                        return "iOS"
                        #elseif os(watchOS)
                        return "watchOS"
                        #elseif os(tvOS)
                        return "tvOS"
                        #elseif os(macOS)
                        return "OS X"
                        #elseif os(Linux)
                        return "Linux"
                        #else
                        return "Unknown"
                        #endif
                    }()
                    
                    return "\(osName) \(versionString)"
                }()
                
                let alamofireVersion: String = {
                    guard
                        let afInfo = Bundle(for: SessionManager.self).infoDictionary,
                        let build = afInfo["CFBundleShortVersionString"]
                        else { return "Unknown" }
                    
                    return "Alamofire/\(build)"
                }()
                
                return "\(executable)/\(appVersion) (\(bundle); build:\(appBuild); \(osNameVersion)) \(alamofireVersion)"
            }
            
            return "Alamofire"
        }()
        
        return [
            "Accept-Encoding": acceptEncoding,
            "Accept-Language": acceptLanguage,
            "User-Agent": userAgent
        ]
    }()
    
    
    
    private let sessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        
        return SessionManager(configuration: configuration)
    }()
    
    private let lock = NSLock()
    
    private var accessToken: String
    private var oldAccessToken: String
    private var authentication : Bool
    
    private var isRefreshing = false
    private var requestsToRetry: [RequestRetryCompletion] = []
    
    // MARK: - Initialization
    
    public init(accessToken: String, oldAccessToken: String, authentication: Bool) {
        self.accessToken = accessToken
        self.oldAccessToken = oldAccessToken
        self.authentication = authentication
    }
    
    // MARK: - RequestAdapter
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        if let urlString = urlRequest.url?.absoluteString, urlString.hasPrefix(Constants.baseURLString) {//Esta es la url vieja por lo tanto se queda igual
            var urlRequest = urlRequest
            if self.authentication
            {
                //Aqui esta el pex, si aqui nos equivocamos ya felpo, basicamente aqui el sessionManager agrega el token a la peticion, ya que usa un retrier, es decir cuando la sesion caduca refresca el token, pero aqui tendremos que validar que URL es la que se esta invocando para poder decidir que token establecer. Y como tiene una variable global tenemos que agregar otra para el viejo token
                urlRequest.setValue("Bearer " + oldAccessToken, forHTTPHeaderField: "Authorization") //urlVieja con token viejo
            }
            return urlRequest
        }
        else if let urlString = urlRequest.url?.absoluteString, urlString.hasPrefix(Constants.newBaseURLString) {//Esta es la url nueva entonces se cambia
            var urlRequest = urlRequest
            if self.authentication
            {
                //Aqui esta el pex, si aqui nos equivocamos ya felpo, basicamente aqui el sessionManager agrega el token a la peticion, ya que usa un retrier, es decir cuando la sesion caduca refresca el token, pero aqui tendremos que validar que URL es la que se esta invocando para poder decidir que token establecer. Y como tiene una variable global tenemos que agregar otra para el viejo token
                urlRequest.setValue("Bearer " + accessToken, forHTTPHeaderField: "Authorization") //urlNuevo con token nuevo
            }
            return urlRequest
        }
        return urlRequest
    }
    
    // MARK: - RequestRetrier
    
    func should(_ manager: SessionManager, retry request: Request, with error: Error, completion: @escaping RequestRetryCompletion) {
        lock.lock() ; defer { lock.unlock() }
        
        if let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 {
            requestsToRetry.append(completion)
            
            if !isRefreshing {
                refreshTokens { [weak self] succeeded, accessToken, oldAccessToken in
                    guard let strongSelf = self else { return }
                    
                    strongSelf.lock.lock() ; defer { strongSelf.lock.unlock() }
                    
                    if let accessToken = accessToken, let oldAccessToken = oldAccessToken {
                        strongSelf.accessToken = accessToken
                        strongSelf.oldAccessToken = oldAccessToken
                    }
                    
                    strongSelf.requestsToRetry.forEach { $0(succeeded, 0.0) }
                    strongSelf.requestsToRetry.removeAll()
                }
            }
        } else {
            completion(false, 0.0)
        }
    }
    
    // MARK: - Private - Refresh Tokens
    
    private func refreshTokens(completion: @escaping RefreshCompletion) {
        guard !isRefreshing else { return }
        
        isRefreshing = true
        
        if Settings.sharedInstance.getAccessToken() != nil && Settings.sharedInstance.getAccessToken() != ""
        {
            let urlString = "\(Constants.newBaseURLString)/customer/v2/signup/facebook/\(Settings.sharedInstance.getAccessToken()!)"
            
            let headersRequest: HTTPHeaders = [
                "x-app-id": Constants.appID,
                "Accept": "application/json",
                "Content-Type" : "application/json",
                "Accept-Language" : Constants.language,
                "User-Agent" : Commons.getUserAgent(),
                "Time-Zone" : TimeZone.current.identifier
            ]
            
            sessionManager.request(urlString, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headersRequest).responseJSON {
                [weak self] response in
                guard let strongSelf = self else { return }
                
                if
                    let json = response.result.value as? [String: Any],
                    let accessToken = json["token"] as? String,
                    let yopterToken = json["tokenYopter"] as? String
                {
                    Settings.sharedInstance.setToken(value: accessToken)
                    Settings.sharedInstance.setOldToken(value: yopterToken)
                    completion(true, accessToken, yopterToken)
                } else {
                    completion(false, nil, nil)
                }
                
                strongSelf.isRefreshing = false
            }
        }
        else
        {
            let headersRequest: HTTPHeaders = [
                "x-app-id": Constants.appID,
                "Accept": "application/json",
                "Content-Type" : "application/json"
            ]
            
            let urlString = "\(Constants.newBaseURLString)/auth/login"
            
            let parameters: [String: Any] = [
                "email": Settings.sharedInstance.getUsername()!,
                "password": Settings.sharedInstance.getPassword()!,
                "userAgent": Commons.getUserAgent()
            ]
            
            sessionManager.request(urlString, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headersRequest)
                .responseJSON { [weak self] response in
                    guard let strongSelf = self else { return }
                    
                    if
                        let json = response.result.value as? [String: Any],
                        let accessToken = json["token"] as? String,
                        let yopterToken = json["tokenYopter"] as? String
                    {
                        Settings.sharedInstance.setToken(value: accessToken)
                        Settings.sharedInstance.setOldToken(value: yopterToken)
                        completion(true, accessToken, yopterToken)
                    } else {
                        completion(false, nil, nil)
                    }
                    
                    strongSelf.isRefreshing = false
            }
        }
    }
}

