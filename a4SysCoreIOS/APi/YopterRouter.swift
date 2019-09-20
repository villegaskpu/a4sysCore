//
//  YopterRouter.swift
//  Yopter
//
//  Created by Yoptersys on 3/30/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import Foundation
import Alamofire

enum YopterRouter: URLRequestConvertible
{
    case Login(parameter: Parameters)
    case Register(parameter: Parameters)
    case ForgotPassword(parameter: Parameters)
    case ChangePassword(parameter: Parameters)
    case OfferSearch(parameter: Parameters)
    case OfferByBeacon(parameter: Parameters)
    case ArticleViewed(idOffer: String, parameter: Parameters)
    case ArticleRating(idOffer: String, parameter: Parameters)
    case ArticleFavorite(idOffer: String, parameter: Parameters)
    case ArticleDelete(idOffer: String, parameter: Parameters)
    case StoresSearch(parameter: Parameters)
    case OfferViewed(idOffer: String, parameter: Parameters)
    case OfferTaken(idOffer: String, parameter: Parameters)
    case OfferRating(idOffer: String, parameter: Parameters)
    case OfferFavorite(idOffer: String, parameter: Parameters)
    case OfferDelete(idOffer: String, parameter: Parameters)
    case BeaconAnnouncements(parameter: [[String : Any]])
    case GetCategories
    case GetCountries
    case GetStates
    case WakeUp(parameter: Parameters)
    case GetReportReason
    case GetReportSucursal
    case BeaconTracking(parameter: [[String : Any]])
    case GetStatistics(parameter: Parameters)
    case Logout
    case GetStores(idOffer: String, parameter: Parameters)
    case GetFavoriteOffers(parameter: Parameters)
    case ChangeProduct(parameter: Parameters)
    case SuccessNotification(idNotification: String, parameter: Parameters)
    case ReportOffer(idOffer: String, parameter: Parameters)
    case GetHome(parameter: Parameters)
    case HeartBeat(parameter: [[String : Any]])
    case OfferShowed(parameter: [[String : Any]])
    case ValidateToken
    case Suggest(term: String)
    case FBLogin(accesstoken: String)
    case WhoAmI (parameter : Parameters)
    case Geofencing(parameter: Parameters)
    case Arrived(idNotification: String, parameter: Parameters)
    case GetArticles(parameter: Parameters)
    case GetFavoriteArticles(parameter: Parameters)
    case SearchArticle(idArticle: String)
    case ValidateGender(idEmployee: String)
    case GetTheme(parameter: Parameters)
    case GetCompanies(parameter: Parameters)
    case GetFilters
    case OfferSearchFilter(parameter: Parameters)
    
    
    var method : HTTPMethod{
        switch self {
        case .SearchArticle:
            return .get
        case .Login:
            return .post
        case .Register:
            return .post
        case .ForgotPassword:
            return .post
        case .ChangePassword:
            return .post
        case .OfferSearch:
            return .post
        case .OfferByBeacon:
            return .post
        case .StoresSearch:
            return .post
        case .OfferViewed:
            return .put
        case .OfferTaken:
            return .put
        case .OfferRating:
            return .put
        case .OfferFavorite:
            return .put
        case .OfferDelete:
            return .put
        case .BeaconAnnouncements:
            return .post
        case .GetCategories:
            return .get
        case .GetCountries:
            return .get
        case .GetStates:
            return .get
        case .WakeUp:
            return .put
        case .GetReportReason:
            return .get
        case .GetReportSucursal:
            return .get
        case .BeaconTracking:
            return .put
        case .GetStatistics:
            return .post
        case .Logout:
            return .delete
        case .GetStores:
            return .post
        case .GetFavoriteOffers:
            return .post
        case .ChangeProduct:
            return .put
        case .SuccessNotification:
            return .put
        case .ReportOffer:
            return .put
        case .GetHome:
            return .post
        case .HeartBeat:
            return .put
        case .OfferShowed:
            return .put
        case .ValidateToken:
            return .get
        case .Suggest:
            return .get
        case .FBLogin:
            return .get
        case .WhoAmI:
            return .post
        case .Geofencing:
            return .post
        case .Arrived:
            return .put
        case .GetArticles:
            return .post
        case .GetFavoriteArticles:
            return .post
        case .ValidateGender:
            return .get
        case .ArticleViewed:
            return .put
        case .ArticleRating:
            return .put
        case .ArticleFavorite:
            return .put
        case .ArticleDelete:
            return .put
        case .GetTheme:
            return .post
        case .GetCompanies:
            return .post
        case .GetFilters:
            return .post
        case .OfferSearchFilter:
            return .post
        }
    }
    
    var path: String{
        switch self
        {
        case .SearchArticle(let idArticle):
            return "/article/\(idArticle)"
        case .Login:
            return "/auth/login"
        case .Register:
            return "/comunica/signup"
        case .ForgotPassword:
            return "/customer/v2/password/reset"
        case .ChangePassword:
            return "/customer/v2/password/change"
        case .OfferSearch:
            return "/customer/v2/offer"
        case .OfferByBeacon:
            return "/customer/v1/offer/beacon"
        case .StoresSearch:
            return "/customer/v1/store/search"
        case .OfferViewed(let idOffer, _):
            return "/customer/v1/offer/\(idOffer)/viewed"
        case .OfferTaken(let idOffer, _):
            return "/customer/v1/offer/\(idOffer)/take"
        case .OfferRating(let idOffer, _):
            return "/customer/v1/offer/\(idOffer)/rating"
        case .OfferFavorite(let idOffer, _):
            return "/customer/v1/offer/\(idOffer)/favorite"
        case .OfferDelete(let idOffer, _):
            return "/customer/v1/offer/\(idOffer)/delete"
        case .BeaconAnnouncements:
            return "/customer/v1/offer/beacon/announcement"
        case .GetCategories:
            return "/customer/v1/category"
        case .ArticleViewed(let idOffer, _):
            return "/customer/v1/offer/\(idOffer)/viewed"
        case .ArticleRating(let idOffer, _):
            return "/customer/v1/offer/\(idOffer)/rating"
        case .ArticleFavorite(let idOffer, _):
            return "/customer/v1/offer/\(idOffer)/favorite"
        case .ArticleDelete(let idOffer, _):
            return "/customer/v1/offer/\(idOffer)/delete"
        case .GetCountries:
            return "/customer/v1/commons/country"
        case .GetStates:
            return "/customer/v1/commons/country/141/state"
        case .WakeUp:
            return "/customer/v2/wakeup"
        case .GetReportReason:
            return "/customer/v1/offer/reportreason"
        case .GetReportSucursal:
            return "/customer/v1/offer/store/reportsucursal"
        case .BeaconTracking:
            return "/customer/v3/beacon/tracking"
        case .GetStatistics:
            return "/customer/v1/statistic"
        case .Logout:
            return "/auth/logout"
        case .GetStores(let idOffer, _):
            return "/customer/v1/offer/\(idOffer)/store"
        case .GetFavoriteOffers:
            return "/customer/v1/offer/favorite"
        case .ChangeProduct:
            return "/customer/v1/santander/product/switch"
        case .SuccessNotification(let idNotification, _):
            return "/customer/notification/\(idNotification)/readed"
        case .ReportOffer(let idOffer, _):
            return "/customer/v1/offer/\(idOffer)/report"
        case .GetHome:
            return "/customer/v2/offer/home"
        case .HeartBeat:
            return "/customer/v1/heartbeat"
        case .OfferShowed:
            return "/customer/v2/offer/show"
        case .ValidateToken:
            return "/auth/login/token"
        case .Suggest:
            return "/customer/v2/offer/suggest"
        case .FBLogin(let accesstoken):
            return "/customer/v2/signup/facebook/\(accesstoken)"
        case .WhoAmI:
            return "/pois/whereami"
        case .Geofencing:
            return "/geofences/centroid"
        case .Arrived(let idNotification, _):
            return "/customer/notification/\(idNotification)/arrived"
        case .GetArticles:
            return "/customer/article/home"
        case .GetFavoriteArticles:
            return "/customer/v1/offer/favorite"
        case .ValidateGender(let idEmployee):
            return "/employee/\(idEmployee)"
        case .GetTheme:
            return "refresh-config"
        case .GetCompanies:
            return "/companies/employee"
        case .GetFilters:
            return "/refresh/category/alias"
        case .OfferSearchFilter:
            return "/category/alias/offers"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let url = try WebService.baseURLString.asURL()
        var urlRequest = URLRequest(url: (url.appendingPathComponent(path)))
        
        urlRequest.httpMethod = method.rawValue
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
        
        if let appid = globalConstants.filter({$0.key == "appID"}).first {
            urlRequest.addValue("\(appid.value)", forHTTPHeaderField: "x-app-id")
        }
        
        
        urlRequest.addValue(Commons.getUserAgent(), forHTTPHeaderField: "user-agent")
        urlRequest.addValue("es-MX", forHTTPHeaderField: "Accept-Language")
        urlRequest.addValue(TimeZone.current.identifier, forHTTPHeaderField: "Time-Zone")
        
        if let tokenYopter = globalConstants.filter({$0.key == "tokenYopter"}).first {
            print("tokenYopter.value: \(tokenYopter.value)")
            urlRequest.addValue("bearer \(tokenYopter.value)", forHTTPHeaderField: "Authorization")
        }
        
        
        
        print("useragent: \(Commons.getUserAgent())")
        
        switch self
        {
        case .SearchArticle(_):
            let newUrl = try Constants.newBaseURLString.asURL()
            urlRequest.url = newUrl.appendingPathComponent(path)
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: nil)
        case .Login(let parameters):
            print("WebService.newBaseURLString: \(WebService.newBaseURLString) --- path: \(path)")
            let newUrl = try WebService.newBaseURLString.asURL()
            urlRequest.url = newUrl.appendingPathComponent(path)
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .Register(let parameters):
            let newUrl = try Constants.newBaseURLString.asURL()
            urlRequest.url = newUrl.appendingPathComponent(path)
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .ForgotPassword(let parameters):
            let newUrl = try Constants.newBaseURLString.asURL()
            urlRequest.url = newUrl.appendingPathComponent(path)
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .ChangePassword(let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .OfferSearch(let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .OfferByBeacon(let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .StoresSearch(let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .OfferViewed(_, let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .OfferTaken(_, let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .OfferRating(_, let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .OfferFavorite(_, let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .OfferDelete(_, let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .BeaconAnnouncements(let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, withJSONObject: parameters)
        case .GetCategories:
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: nil)
        case .GetCountries:
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: nil)
        case .GetStates:
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: nil)
        case .WakeUp(let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .ArticleViewed(_, let parameters):
            let newUrl = try Constants.newBaseURLString.asURL()
            urlRequest.url = newUrl.appendingPathComponent(path)
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .GetReportReason:
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: nil)
        case .GetReportSucursal:
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: nil)
        case .ArticleRating(_, let parameters):
            let newUrl = try Constants.newBaseURLString.asURL()
            urlRequest.url = newUrl.appendingPathComponent(path)
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .ArticleDelete(_, let parameters):
            let newUrl = try Constants.newBaseURLString.asURL()
            urlRequest.url = newUrl.appendingPathComponent(path)
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .ArticleFavorite(_, let parameters):
            let newUrl = try Constants.newBaseURLString.asURL()
            urlRequest.url = newUrl.appendingPathComponent(path)
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .BeaconTracking(let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, withJSONObject: parameters)
        case .GetStatistics(let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .Logout:
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: nil)
        case .GetStores(_, let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .GetFavoriteOffers(let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .ChangeProduct(let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .SuccessNotification(_, let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .ReportOffer(_, let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .GetHome(let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .HeartBeat(let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, withJSONObject: parameters)
        case .OfferShowed(let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, withJSONObject: parameters)
        case .ValidateToken:
            urlRequest = try JSONEncoding.default.encode(urlRequest)
        case .Suggest(let term):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: ["q" : term])
        case .FBLogin:
            urlRequest = try JSONEncoding.default.encode(urlRequest)
        case .WhoAmI(let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .Geofencing(let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .Arrived(_, let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .GetArticles(let parameters):
            let newUrl = try Constants.newBaseURLString.asURL()
            urlRequest.url = newUrl.appendingPathComponent(path)
            
            
            if let tokenYopter = globalConstants.filter({$0.key == "token"}).first {
                print("tokenYopter.valueNETOKKKKK: \(tokenYopter.value)")
                urlRequest.setValue("bearer \(tokenYopter.value)", forHTTPHeaderField: "Authorization")
            }
            
            
            
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .GetFavoriteArticles(let parameters):
            
            let baseurl = Constants.newBaseURLString
            let queryStringParam  =  [
                "type":"article"
            ]
            let queryItems = queryStringParam.map  { URLQueryItem(name: $0.key, value: $0.value) }
            
            var urlComponent = URLComponents(string: baseurl)!
            urlComponent.queryItems = queryItems
            
            let finalUrl = try urlComponent.asURL()
            
            urlRequest = URLRequest(url: (finalUrl.appendingPathComponent(path)))
            
            urlRequest.httpMethod = method.rawValue
            urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
            urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
            urlRequest.addValue(Constants.appID, forHTTPHeaderField: "x-app-id")
            urlRequest.addValue(Commons.getUserAgent(), forHTTPHeaderField: "user-agent")
            urlRequest.addValue(Constants.language, forHTTPHeaderField: "Accept-Language")
            urlRequest.addValue(TimeZone.current.identifier, forHTTPHeaderField: "Time-Zone")
            
            
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .ValidateGender:
            urlRequest = try JSONEncoding.default.encode(urlRequest)
        case .GetTheme(let parameters):
            let newUrl = try Constants.newBaseURLString.asURL()
            urlRequest.url = newUrl.appendingPathComponent(path)
            if let tokenYopter = globalConstants.filter({$0.key == "token"}).first {
                urlRequest.setValue("bearer \(tokenYopter.value)", forHTTPHeaderField: "Authorization")
            }
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .GetCompanies(let parameters):
            let newUrl = try Constants.newBaseURLString.asURL()
            urlRequest.url = newUrl.appendingPathComponent(path)
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .GetFilters:
            if let appid = globalConstants.filter({$0.key == "appID"}).first {
                let queryStringParam  =  [
                    "xAppId": appid.value,
                    "lastUpdate": "2019-04-28"
                ]
                print("getFilter")
                urlRequest = try JSONEncoding.default.encode(urlRequest, with: queryStringParam)
            }
        case .OfferSearchFilter(let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        }

        return urlRequest
    }
}

