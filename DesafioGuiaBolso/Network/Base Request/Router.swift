//
//  ClientRequest.swift
//  DesafioGuiaBolso
//
//  Created by Paulo Rosa on 24/01/20.
//  Copyright © 2020 Paulo Rosa. All rights reserved.
//

import UIKit

class Router<EndPoint:EndPointType>:NetworkRouter {
    private var task:URLSessionTask?
    
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion) {
        let session = URLSession.shared
        do {
            let request = try self.buildRequest(from: route)
            task = session.dataTask(with: request, completionHandler: { (data, response, error) in
                NetworkLog.log(with: request)
                DispatchQueue.main.async {
                    completion(data, response, error)
                }
            })
            
        }catch {
            DispatchQueue.main.async {
                completion(nil, nil, error)
            }
        }
        self.task?.resume()
    }
    
    func cancel() {
        self.task?.cancel()
    }
    
    fileprivate func buildRequest(from route:EndPoint) throws -> URLRequest {
        var request:URLRequest = URLRequest(url: route.baseUrl.appendingPathComponent(route.path), cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 99999)
        request.httpMethod = route.httpMethod.rawValue
        do {
            switch route.task {
            case .request:
                request.setValue(ConstantsNetwork.ContentType.json.rawValue, forHTTPHeaderField: ConstantsNetwork.HttpHeaderField.contentType.rawValue)
            case .requestParameters(let bodyParameters, let urlParameters):
                try self.configureParameters(bodyParameters: bodyParameters, urlParameters: urlParameters, request: &request)
            case .requestParametersAndHeader(let bodyParameters, let urlParameters, let additionalHeader):
                self.addAdditionalHeader(additionalHeader, request: &request)
                try self.configureParameters(bodyParameters: bodyParameters, urlParameters: urlParameters, request: &request)
            }
            return request
        } catch {
            throw error
        }
    }
    
    fileprivate func configureParameters(bodyParameters:Parameters?, urlParameters:Parameters?, request: inout URLRequest) throws {
        do {
            if let body = bodyParameters {
                try JSONParameterEncoder.encode(urlRequest: &request, with: body)
            }
            if let url = urlParameters {
                try URLParameterEncoder.encode(urlRequest: &request, with: url)
            }
        }catch {
            throw error
        }
    }
    
    fileprivate func addAdditionalHeader(_ additionalHeader: HTTPHeaders?, request:inout URLRequest) {
        guard let header = additionalHeader else {return}
        for (key, value) in header {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
}
