//
//  LoginRequest.swift
//  Yopter
//
//  Created by Yoptersys on 4/19/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import Foundation

open class Requests{
    open class func createLoginRequest(_ user: String,_ password: String, userAgent:String) -> [String : Any]
    {
        return ["email" : user, "password" : password, "userAgent" : userAgent]
    }
    
    open class func createSignUpRequest(_ employeeNum: String, _ birthday:String, _ gender: String, _ email: String, _ password: String, _ latitude: String, _ longitude: String, _ idCompany:Int) -> [String : Any]
    {
        return ["idEmployee" : employeeNum, "birthday" : birthday, "gender": gender, "email" : email, "password" : password, "context" : ["latitude" : latitude, "longitude" : longitude], "company": ["idCompany": idCompany]]
    }
    
    open class func createForgotPasswordRequest(_ email: String) -> [String : Any]
    {
        return ["email" : email]
    }
    
    open class func createSearchOfferRequest(_ keyword: String, _ page: Int, _ rows: Int, _ latitude: Double, _ longitude: Double) -> [String : Any]
    {
        return ["search" : ["value" : keyword, "state" : ["idState" : "", "country" : ["idCountry" : Constants.idCountry]], "page" : page, "rows" : rows], "context" : ["location" : ["latitude": latitude, "longitude" : longitude]]]
    }
    
    open class func createSearchOfferByCategoryRequest(_ parentCategory: Int, _ page: Int, _ rows: Int, _ latitude: Double, _ longitude: Double) -> [String : Any]
    {
        
        return [
            "search": [
                "value": "",
                "page": page,
                "rows": rows,
                "categories":[
                [
                "categoryAlias": [
                "idCategoryAlias": parentCategory
                ]
                ]
                ]
            ],
            "context": [
                "location":    [
                    "latitude": latitude,
                    "longitude": longitude
                ]
            ]
        ]
    }
    
    open class func createSearchStoreRequest(_ keyword: String, _ page: Int, _ rows: Int, _ latitude: Double, _ longitude: Double, _ radio: Int) -> [String : Any]
    {
        return ["search" : ["value" : keyword, "page" : page, "rows" : rows], "context" : ["location" : ["latitude": latitude, "longitude" : longitude], "radio" : radio]]
    }
    
//    open class func createSearchStoreByFilterRequest(_ categories: [Category], _ page: Int, _ rows: Int, _ latitude: Double, _ longitude: Double, _ radio: Int) -> [String : Any]
//    {
//        return ["search" : ["value" : "", "categories" : categories.toJSON(), "page" : page, "rows" : rows], "context" : ["location" : ["latitude": latitude, "longitude" : longitude], "radio" : radio]]
//    }

    
    open class func createViewOfferRequest(_ latitude: Double, _ longitude: Double) -> [String : Any]
    {
        return ["date" : Commons.getCurrentDate(), "latitude" : latitude, "longitude" : longitude]
    }
    
    open class func createTakeOfferRequest(_ latitude: Double, _ longitude: Double) -> [String: Any]
    {
        return ["date" : Commons.getCurrentDate(), "latitude" : latitude, "longitude" : longitude]
    }
    
    open class func createRateOfferRequest(_ score: Int, _ latitude: Double, _ longitude: Double) -> [String: Any]
    {
        return ["date" : Commons.getCurrentDate(), "score" : score, "latitude" : latitude, "longitude" : longitude]
    }
    
    open class func createFavoriteOfferRequest(_ idOffer: Int, _ favorite: Int, _ idCustomer: String, _ latitude: Double, _ longitude: Double) -> [String : Any]
    {
        return ["date" : Commons.getCurrentDate(), "idOffer" : idOffer, "favorite" : favorite, "idCustomer" : idCustomer, "latitude" : latitude, "longitude" : longitude]
    }
    
    open class func createDeleteOfferRequest() -> [String : Any]
    {
        return ["date" : Commons.getCurrentDate()]
    }
    
    open class func createBeconAnnouncementObject(_ major: String, _ minor: String) -> [String : Any]
    {
        return ["uuid" : Constants.uuid, "major" : major, "minor" : minor]
    }
    
    open class func createWakeUpRequest(advertisementId : String?) -> [String : Any]
    {
        print("Settings.sharedInstance.getDeviceId()frame: \(Settings.sharedInstance.getDeviceId())")
        return ["deviceId" : Settings.sharedInstance.getDeviceId() ?? "", "idAdvertisement" : advertisementId ?? ""]
    }
    open class func createWhoAmIRequiest() -> [String : Any]
    {
        return ["deviceId" : Settings.sharedInstance.getDeviceId() ?? ""]
    }
    
//    open class func createBeaconTrackingRequest(_ beaconArray : [BeaconTrack]) -> [[String : Any]]
//    {
//        return beaconArray.toJSON()
//    }
    
    open class func createStatisticsRequest() -> [String : Any]
    {
        return ["from" : Commons.getShortDateSinceSevenDay() , "to" : Commons.getShortCurrentDate()]
    }
    
    open class func createGetStoresRequest(_ latitude : Double, _ longitude : Double) -> [String : Any]
    {
        return ["latitude" : latitude, "longitude" : longitude]
    }
    
    open class func createFavoriteOffersRequest(_ keyword: String, _ page: Int, _ rows: Int, _ latitude: Double, _ longitude: Double) -> [String : Any]
    {
        return ["search" : ["value" : keyword, "page" : page, "rows" : rows], "context" : ["location" : ["latitude": latitude, "longitude" : longitude]]]
    }
    
    open class func createChangeProductRequest(_ idCode : String, _ idProduct : Int) -> [String : Any]
    {
        return ["idCode" : idCode, "idProduct" : idProduct]
    }
    
    open class func createSuccesNotificationRequest(_ idOnCloud : String) -> [String : Any]
    {
        return ["idOnCloud" : idOnCloud]
    }
    
    open class func createReportOfferRequest(_ idReportReason : String, _ note : String, _ latitude: Double, _ longitude: Double, _ idStore: Int) -> [String : Any]
    {
        return ["idReportReason" : idReportReason, "note" : note, "date" : Commons.getCurrentDate(), "latitude" : latitude, "longitude" : longitude, "idStore" : idStore]
    }
    
    open class func createHomeRequest(_ keyword: String, _ page: Int, _ rows: Int, _ latitude: Double, _ longitude: Double) -> [String : Any]
    {
        return ["search" : ["value" : keyword, "state" : ["idState" : "", "country" : ["idCountry" : Constants.idCountry]], "page" : page, "rows" : rows], "context" : ["location" : ["latitude": latitude, "longitude" : longitude]]]
    }
    
    open class func createHeartBeatObject(_ latitude : Double, _ longitude : Double) -> [String : Any]
    {
        return ["latitude" : latitude, "longitude" : longitude, "beatAt" : Commons.getCurrentDate()]
    }
    
//    open class func createShowedOfferRequest(_ showed: [Showed]) -> [[String : Any]]
//    {
//        return showed.toJSON()
//    }
    
    open class func createAddExternalInfoRequest(_ idExternal : String) -> [String : Any]
    {
        return ["externalInfo" : ["idExternal" : idExternal]]
    }
    
    open class func createGeofencesRequest(_ latitude: String, longitude: String) -> [String : Any]
    {
        return ["location" : ["latitude" : latitude, "longitude" : longitude], "radio" : 10]
    }
    
    open class func createThemeRequest() -> [String : Any]
    {
        return ["date" : Settings.sharedInstance.getDateRefreshTheme()]
    }
    
    open class func createThemeRequestHeartbeat() -> [String : Any]
    {
        
        let parameters = [
            "latitude": "\(LocationUtil.sharedInstance.currentLocation?.coordinate.latitude ?? 0)",
            "longitude": "\(LocationUtil.sharedInstance.currentLocation?.coordinate.longitude ?? 0)",
            "beatAt": Commons.getCurrentDate()]
        
        return parameters
    }
    
    open class func createFilters(_ appId: String) -> [String : Any] {
        let queryStringParam  =  [
            "xAppId": appId,
            "lastUpdate": "2019-04-28"
        ]
        
        return queryStringParam
    }
}
