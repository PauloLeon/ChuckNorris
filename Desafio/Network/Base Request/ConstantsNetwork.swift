//
//  ConstantsNetwork.swift
//  DesafioGuiaBolso
//
//  Created by Paulo Rosa on 24/01/20.
//  Copyright © 2020 Paulo Rosa. All rights reserved.
//


struct ConstantsNetwork {
    
    static let baseUrl = "https://api.chucknorris.io/jokes"
    
    struct Parameters {
        static let category = "category"
    }
    
    struct Paths {
        static let category = "/categories"
        static let random = "/random"
    }
    
    enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
    
    enum ContentType: String {
        case json = "application/json"
    }
}
