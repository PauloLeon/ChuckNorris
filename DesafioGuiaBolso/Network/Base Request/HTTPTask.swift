//
//  HTTPTask.swift
//  DesafioGuiaBolso
//
//  Created by Paulo Rosa on 24/01/20.
//  Copyright © 2020 Paulo Rosa. All rights reserved.
//

import UIKit

public typealias HTTPHeaders = [String:String]
public typealias Parameters = [String:Any]

public enum HTTPTask {
    case request
    
    case requestParameters(bodyParameters:Parameters?,
                           urlParameters:Parameters?)
    
    case requestParametersAndHeader(bodyParameters:Parameters?,
                                    urlParameters:Parameters?,
                                    additionalHeader:HTTPHeaders?)
}
