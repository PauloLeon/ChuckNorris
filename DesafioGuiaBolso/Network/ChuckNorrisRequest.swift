//
//  ChuckNorrisRequest.swift
//  DesafioGuiaBolso
//
//  Created by Paulo Rosa on 24/01/20.
//  Copyright © 2020 Paulo Rosa. All rights reserved.
//

import Foundation
import UIKit

public enum ChuckNorrisAPI {
    case getCategories
    case getRandomJoke(category: String)
}

extension ChuckNorrisAPI: EndPointType {
    var baseUrl: URL {
        return URL(string: ConstantsNetwork.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .getCategories:
            return ConstantsNetwork.Paths.category
        case .getRandomJoke(_):
            return ConstantsNetwork.Paths.random
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .getCategories:
            return .requestParameters(bodyParameters: nil, urlParameters: nil)
        case .getRandomJoke(let category):
            return .requestParameters(bodyParameters: nil, urlParameters: [ConstantsNetwork.Parameters.category: category])
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getCategories:
            return .get
        case .getRandomJoke(_):
            return .get
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    

}

public struct ChuckNorrisManager: EndPointManager {
    typealias T = ChuckNorrisAPI
    
    public func getCategories(successHandler: @escaping ( _ sucess: Categories) ->(),
                             errorHandler: @escaping ( _ error:Error) ->()) {
        
         router.request(.getCategories) { (data, response, error) in
             let result:DecodeResult<Categories> = DecoderResponse().decodeResponser(data: data, response: response, error: error)

             switch result {
             case .success(let model):
                 successHandler(model)
             case .failure(let error):
                 errorHandler(error)
             }
         }
     }
    
    public func getJoke(category: String,
                        successHandler: @escaping ( _ sucess: Joke) ->(),
                            errorHandler: @escaping ( _ error:Error) ->()) {
       
        router.request(.getRandomJoke(category: category)) { (data, response, error) in
            let result:DecodeResult<Joke> = DecoderResponse().decodeResponser(data: data, response: response, error: error)

            switch result {
            case .success(let model):
                successHandler(model)
            case .failure(let error):
                errorHandler(error)
            }
        }
    }


}
