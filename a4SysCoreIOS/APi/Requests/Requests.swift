//
//  LoginRequest.swift
//  Yopter
//
//  Created by Yoptersys on 4/19/17.
//  Copyright © 2017 Yopter. All rights reserved.
//

import Foundation

public class Requests{
    static func createLoginRequest(_ user: String,_ password: String) -> [String : Any]
    {
        return ["email" : user, "password" : password, "userAgent" : Commons.getUserAgent()]
    }
    
    static func createSignUpRequest(_ employeeNum: String, _ birthday:String, _ gender: String, _ email: String, _ password: String, _ latitude: String, _ longitude: String, _ idCompany:Int) -> [String : Any]
    {
        return ["idEmployee" : employeeNum, "birthday" : birthday, "gender": gender, "email" : email, "password" : password, "context" : ["latitude" : latitude, "longitude" : longitude], "company": ["idCompany": idCompany]]
    }
    
    static func createForgotPasswordRequest(_ email: String) -> [String : Any]
    {
        return ["email" : email]
    }
    
    static func createSearchOfferRequest(_ keyword: String, _ page: Int, _ rows: Int, _ latitude: Double, _ longitude: Double) -> [String : Any]
    {
        return ["search" : ["value" : keyword, "state" : ["idState" : "", "country" : ["idCountry" : Constants.idCountry]], "page" : page, "rows" : rows], "context" : ["location" : ["latitude": latitude, "longitude" : longitude]]]
    }
    
    static func createSearchOfferByCategoryRequest(_ parentCategory: Int, _ page: Int, _ rows: Int, _ latitude: Double, _ longitude: Double) -> [String : Any]
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
    
    static func createSearchStoreRequest(_ keyword: String, _ page: Int, _ rows: Int, _ latitude: Double, _ longitude: Double, _ radio: Int) -> [String : Any]
    {
        return ["search" : ["value" : keyword, "page" : page, "rows" : rows], "context" : ["location" : ["latitude": latitude, "longitude" : longitude], "radio" : radio]]
    }
    
    static func createSearchStoreByFilterRequest(_ categories: [Category], _ page: Int, _ rows: Int, _ latitude: Double, _ longitude: Double, _ radio: Int) -> [String : Any]
    {
        return ["search" : ["value" : "", "categories" : categories.toJSON(), "page" : page, "rows" : rows], "context" : ["location" : ["latitude": latitude, "longitude" : longitude], "radio" : radio]]
    }

    
    static func createViewOfferRequest(_ latitude: Double, _ longitude: Double) -> [String : Any]
    {
        return ["date" : Commons.getCurrentDate(), "latitude" : latitude, "longitude" : longitude]
    }
    
    static func createTakeOfferRequest(_ latitude: Double, _ longitude: Double) -> [String: Any]
    {
        return ["date" : Commons.getCurrentDate(), "latitude" : latitude, "longitude" : longitude]
    }
    
    static func createRateOfferRequest(_ score: Int, _ latitude: Double, _ longitude: Double) -> [String: Any]
    {
        return ["date" : Commons.getCurrentDate(), "score" : score, "latitude" : latitude, "longitude" : longitude]
    }
    
    static func createFavoriteOfferRequest(_ idOffer: Int, _ favorite: Int, _ idCustomer: String, _ latitude: Double, _ longitude: Double) -> [String : Any]
    {
        return ["date" : Commons.getCurrentDate(), "idOffer" : idOffer, "favorite" : favorite, "idCustomer" : idCustomer, "latitude" : latitude, "longitude" : longitude]
    }
    
    static func createDeleteOfferRequest() -> [String : Any]
    {
        return ["date" : Commons.getCurrentDate()]
    }
    
    static func createBeconAnnouncementObject(_ major: String, _ minor: String) -> [String : Any]
    {
        return ["uuid" : Constants.uuid, "major" : major, "minor" : minor]
    }
    
    static func createWakeUpRequest(advertisementId : String?) -> [String : Any]
    {
        return ["deviceId" : Settings.sharedInstance.getDeviceId() ?? "", "idAdvertisement" : advertisementId ?? ""]
    }
    static func createWhoAmIRequiest() -> [String : Any]
    {
        return ["deviceId" : Settings.sharedInstance.getDeviceId() ?? ""]
    }
    
    static func createBeaconTrackingRequest(_ beaconArray : [BeaconTrack]) -> [[String : Any]]
    {
        return beaconArray.toJSON()
    }
    
    static func createStatisticsRequest() -> [String : Any]
    {
        return ["from" : Commons.getShortDateSinceSevenDay() , "to" : Commons.getShortCurrentDate()]
    }
    
    static func createGetStoresRequest(_ latitude : Double, _ longitude : Double) -> [String : Any]
    {
        return ["latitude" : latitude, "longitude" : longitude]
    }
    
    static func createFavoriteOffersRequest(_ keyword: String, _ page: Int, _ rows: Int, _ latitude: Double, _ longitude: Double) -> [String : Any]
    {
        return ["search" : ["value" : keyword, "page" : page, "rows" : rows], "context" : ["location" : ["latitude": latitude, "longitude" : longitude]]]
    }
    
    static func createChangeProductRequest(_ idCode : String, _ idProduct : Int) -> [String : Any]
    {
        return ["idCode" : idCode, "idProduct" : idProduct]
    }
    
    static func createSuccesNotificationRequest(_ idOnCloud : String) -> [String : Any]
    {
        return ["idOnCloud" : idOnCloud]
    }
    
    static func createReportOfferRequest(_ idReportReason : String, _ note : String, _ latitude: Double, _ longitude: Double, _ idStore: Int) -> [String : Any]
    {
        return ["idReportReason" : idReportReason, "note" : note, "date" : Commons.getCurrentDate(), "latitude" : latitude, "longitude" : longitude, "idStore" : idStore]
    }
    
    static func createHomeRequest(_ keyword: String, _ page: Int, _ rows: Int, _ latitude: Double, _ longitude: Double) -> [String : Any]
    {
        return ["search" : ["value" : keyword, "state" : ["idState" : "", "country" : ["idCountry" : Constants.idCountry]], "page" : page, "rows" : rows], "context" : ["location" : ["latitude": latitude, "longitude" : longitude]]]
    }
    
    static func createHeartBeatObject(_ latitude : Double, _ longitude : Double) -> [String : Any]
    {
        return ["latitude" : latitude, "longitude" : longitude, "beatAt" : Commons.getCurrentDate()]
    }
    
    static func createShowedOfferRequest(_ showed: [Showed]) -> [[String : Any]]
    {
        return showed.toJSON()
    }
    
    static func createAddExternalInfoRequest(_ idExternal : String) -> [String : Any]
    {
        return ["externalInfo" : ["idExternal" : idExternal]]
    }
    
    static func createGeofencesRequest(_ latitude: String, longitude: String) -> [String : Any]
    {
        return ["location" : ["latitude" : latitude, "longitude" : longitude], "radio" : 10]
    }
    
    static func createThemeRequest() -> [String : Any]
    {
        return ["date" : Settings.sharedInstance.getDateRefreshTheme()]
    }
    
    static func createThemeRequestHeartbeat() -> [String : Any]
    {
        
        let parameters = [
            "latitude": "\(LocationUtil.sharedInstance.currentLocation?.coordinate.latitude ?? 0)",
            "longitude": "\(LocationUtil.sharedInstance.currentLocation?.coordinate.longitude ?? 0)",
            "beatAt": Commons.getCurrentDate()]
        
        return parameters
    }
}
