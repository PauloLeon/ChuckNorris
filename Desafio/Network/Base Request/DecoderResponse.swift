//
//  DecoderResponse.swift
//  DesafioGuiaBolso
//
//  Created by Paulo Rosa on 24/01/20.
//  Copyright © 2020 Paulo Rosa. All rights reserved.
//

import UIKit

import UIKit

enum DecodeResult<T> {
    case success(T)
    case failure(NetworkResponse)
}

class DecoderResponse: NSObject {
    
    func decodeResponser<T>(data:Data?,response:URLResponse?,error:Error?) -> DecodeResult<T> where T : Decodable {
        
        if let _ = error {
            return .failure(NetworkResponse.noConnection)
        }
        
        guard let response = response else {
            return .failure(NetworkResponse.noData)
            
        }
        
        let result = NetworkResponseManager.handleNetworkResponse(response as! HTTPURLResponse)
        
        switch result {
        case .success:
            guard let responseData = data else {
                return .failure(NetworkResponse.unableToDecode)
            }
            
            do {
                let obj = try JSONDecoder().decode(T.self, from: responseData)
                return .success(obj)
            } catch {
                return .failure(NetworkResponse.unableToDecode)
            }
            
        case .failure(let netWorkError):
            return .failure(netWorkError)
        }        
    }
}
