//
//  NetworkLog.swift
//  DesafioGuiaBolso
//
//  Created by Paulo Rosa on 24/01/20.
//  Copyright © 2020 Paulo Rosa. All rights reserved.
//

import UIKit

class NetworkLog {
    class func log(with request:URLRequest) {
        print("\n - - - - - - - - - - OUTGOING -> Request - - - - - - - - - - \n")
        defer { print("\n - - - - - - - - - -  END -> Request - - - - - - - - - - \n") }
        let jumpLine = "\n"
        
        let urlString = request.url?.absoluteString ?? ""
        let urlComponents = NSURLComponents(string: urlString)
        
        let method = request.httpMethod != nil ? request.httpMethod ?? "HTTP METHOD NOT FOUND" : "HTTP METHOD NIL"
        let path =  urlComponents?.path ?? "PATH NOT FOUND"
        let query = urlComponents?.query ?? "QUERY NOT FOUND"
        let host =  urlComponents?.host ?? "HOST NOT FOUND"
        
        var logOutput = urlString + jumpLine + jumpLine + method + path + "?" +
            query + "HTTP/1.1" + jumpLine + "HOST:" + host + jumpLine
        
        for (key,value) in request.allHTTPHeaderFields ?? [:] {
            logOutput += key + ": " + value + jumpLine
        }
        if let body = request.httpBody {
            let dataString = NSString(data: body, encoding: String.Encoding.utf8.rawValue) as String?  ?? ""
            logOutput += jumpLine + dataString
        }
        print(logOutput)
    }
}
