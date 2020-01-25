//
//  ClientRequest.swift
//  DesafioGuiaBolso
//
//  Created by Paulo Rosa on 24/01/20.
//  Copyright © 2020 Paulo Rosa. All rights reserved.
//

import UIKit

public typealias CompletionHandler = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()

protocol EndPointType {
    var baseUrl:URL { get }
    var path:String { get }
    var task:HTTPTask { get }
    var httpMethod:HTTPMethod { get }
    var headers:HTTPHeaders? { get }
}

