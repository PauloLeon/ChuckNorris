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
}

extension ChuckNorrisAPI: EndPointType {
    var baseUrl: URL {
        return URL(string: ConstantsNetwork.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .getCategories:
            return "/categories"
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .getCategories:
            return .requestParametersAndHeader(bodyParameters: nil, urlParameters: nil, additionalHeader: nil)
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getCategories:
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


}
