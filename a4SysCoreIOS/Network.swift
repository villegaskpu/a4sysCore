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
    private var idOffert:String = ""
    private var constants: [String:Any] = [:]
    private var EnviromentSet:Environment = .test
    private var terminoAbuscar = ""
    private var idEmpleado = ""
    private var idNotification = ""
    private var IdArticulo = ""
    
    public func setUrlParameters(urlParameters:[String:Any]) {
        self.urlParameters = urlParameters
    }
    
    public func setConstants(constants: [String:Any]) {
        globalConstants = constants
        print("globalConstants: \(globalConstants)")
    }
    
    public func setTerminoAbuscar(_ term: String) {
        self.terminoAbuscar = term
    }
    
    public func setIdNotification(_ idNotification: String) {
        self.idNotification = idNotification
    }
    
    public func setEnvironment(Environment: Environment) {
        ENVIRONMENTFRAME = Environment
        self.EnviromentSet = Environment
    }
    
    public func setIdEmpleado(idEmpleado: String) {
        self.idEmpleado = idEmpleado
    }
    
    private func set(parser: BaseParser) {
        self.parser = parser
    }
    
    private func callService(_ url : URLRequestConvertible, parser:BaseParser, _ respuesta : @escaping (_ statusCode: String, _ value: Any, _ objeto:AnyObject?) ->(Void)) {
        let sessionManager = NetworkManager.sessionManager
        set(parser: parser)
        sessionManager.request(url).responseJSON{ (response) in
            
            let statusCode = response.response?.statusCode ?? 0
//            print("response.result: \(response.request)")
            switch(response.result)
            {
            case .success(let value):
                
//                print("exito: \(value)  statuscCode: \(String(describing: response.response?.statusCode))")
                
                if statusCode >= 200 && statusCode < 300 {
                    let obj = self.parser?.parse(JSONObject: value)
                    respuesta("\(statusCode)", value, obj as AnyObject)
                } else {
                    let obj = self.parseError(JSONObject: value)
                    respuesta("\(statusCode)", value, obj as AnyObject)
                }
                break
            case .failure(let value):
                print("fallo")
                let obj = self.parseError(JSONObject: value)
                respuesta("\(statusCode)", value, obj as AnyObject)
                break
            }
        }
    }
    
    public func setIdOffert(idOfert:String) {
        self.idOffert = idOfert
    }
    
    public func setIdArticulo(IdArticulo:String) {
        self.IdArticulo = IdArticulo
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
        WebService.setup()
        switch endPont {
        case .Login:
            print("llegasteallogin")
            urll = YopterRouter.Login(parameter: self.urlParameters!)
            parserB = LoginParser()
            break
        case .GetTheme:
            urll = YopterRouter.GetTheme(parameter: self.urlParameters!)
            parserB = ConfigurationsParser()
        case .GetHome:
            urll = YopterRouter.GetHome(parameter: self.urlParameters!)
            parserB = HomeParser()
            break
        case .OfferSearch:
            urll = YopterRouter.OfferSearch(parameter: self.urlParameters!)
            parserB = OffertsParser()
        case .OfferRating:
            urll = YopterRouter.OfferRating(idOffer: self.idOffert, parameter: self.urlParameters!)
        case .ArticleRating:
            urll = YopterRouter.ArticleRating(idOffer: self.idOffert, parameter: self.urlParameters!)
        case .GetFavoriteArticles:
            urll = YopterRouter.OfferSearch(parameter: self.urlParameters!)
            parserB = ArticulosParse()
            break
        case .ArticleFavorite:
            urll = YopterRouter.OfferSearch(parameter: self.urlParameters!)
            break
        case .OfferFavorite:
            urll = YopterRouter.OfferFavorite(idOffer: self.idOffert, parameter: self.urlParameters!)
            break
        case .OfferDelete:
            urll = YopterRouter.OfferDelete(idOffer: self.idOffert, parameter: self.urlParameters!)
            break
        case .WakeUp:
            urll = YopterRouter.WakeUp(parameter: self.urlParameters!)
            parserB = WakeUpParser()
            break
        case .GetFilters:
            urll = YopterRouter.GetFilters
            parserB = FilterParse()
            break
        case .StoresSearch:
            urll = YopterRouter.StoresSearch(parameter: self.urlParameters!)
            parserB = StoresParse()
            break
        case .GetArticles:
            urll = YopterRouter.GetArticles(parameter: self.urlParameters!)
            parserB = ArticulosParse()
            break
        case .GetFavoriteOffers:
            urll = YopterRouter.GetFavoriteOffers(parameter: self.urlParameters!)
            parserB = OffertsParser()
        case .ArticleDelete:
            urll = YopterRouter.ArticleDelete(idOffer: self.idOffert, parameter: self.urlParameters!)
        case .OfferTaken:
            urll = YopterRouter.OfferTaken(idOffer: self.idOffert, parameter: self.urlParameters!)
            parserB = OffertTakenResponseParse()
        case .GetReportReason:
            urll = YopterRouter.GetReportReason
            parserB = ReporReasonParser()
        case .GetStores:
            urll = YopterRouter.GetStores(idOffer: self.idOffert, parameter: self.urlParameters!)
            parserB = StoresParse()
        case .ReportOffer:
            urll = YopterRouter.ReportOffer(idOffer: self.idOffert, parameter: self.urlParameters!)
        case .Suggest:
            urll = YopterRouter.Suggest(term: self.terminoAbuscar)
        case .OfferSearchFilter:
            urll = YopterRouter.OfferSearchFilter(parameter: self.urlParameters!)
            parserB = OffertsParser()
        case .ForgotPassword:
            urll = YopterRouter.ForgotPassword(parameter: self.urlParameters!)
        case .GetCompanies:
            urll = YopterRouter.GetCompanies(parameter: self.urlParameters!)
            parserB = CompanysParser()
        case .Register:
            urll = YopterRouter.Register(parameter: self.urlParameters!)
            parserB = SignUpResponseParser()
        case .ValidateGender:
            urll = YopterRouter.ValidateGender(idEmployee: self.idEmpleado)
            parserB = CustomerParser()
        case .HeartBeat:
            urll = YopterRouter.HeartBeat(parameter: [self.urlParameters!])
        case .WhoAmI:
            urll = YopterRouter.WhoAmI(parameter: self.urlParameters!)
            parserB = WhoAmiParse()
        case .SuccessNotification:
            urll = YopterRouter.SuccessNotification(idNotification: self.idNotification, parameter: self.urlParameters!)
        case .SearchArticle:
            urll = YopterRouter.SearchArticle(idArticle: self.IdArticulo)
            parserB = ArticulosParse()
        default:
            print("sin endPoint")
            break
        }
        
        callService(urll!,parser: parserB){ response,value, objeto  in
            _ = callback(response, value, objeto)
        }
    }
}
