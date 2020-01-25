//
//  ClientRequest.swift
//  DesafioGuiaBolso
//
//  Created by Paulo Rosa on 24/01/20.
//  Copyright © 2020 Paulo Rosa. All rights reserved.
//

import Foundation
import UIKit

public enum ClientAPI {
    case getPost(userId: Int)
}

extension ClientAPI: EndPointType {
    var baseUrl: URL {
        return URL(string: ConstantsNetwork.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .getPost(_):
            return "posts"
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .getPost(_):
            return .requestParametersAndHeader(bodyParameters: nil, urlParameters: nil, additionalHeader: nil)
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getPost(_):
            return .get
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    

}

public struct ClientManager: EndPointManager {
    typealias T = ClientAPI
    
    public func getPost(userID: Int,
                          successHandler: @escaping ( _ sucess: Posts) ->(),
                             errorHandler: @escaping ( _ error:Error) ->()) {
        
         router.request(.getPost(userId: userID)) { (data, response, error) in
             let result:DecodeResult<Posts> = DecoderResponse().decodeResponser(data: data, response: response, error: error)

             switch result {
             case .success(let model):
                 successHandler(model)
             case .failure(let error):
                 errorHandler(error)
             }
         }
     }


}
