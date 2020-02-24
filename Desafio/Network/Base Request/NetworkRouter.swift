//
//  NetworkRouter.swift
//  DesafioGuiaBolso
//
//  Created by Paulo Rosa on 24/01/20.
//  Copyright © 2020 Paulo Rosa. All rights reserved.
//

import UIKit

public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()

protocol NetworkRouter: class {
    associatedtype EndPoint:EndPointType
    func request(_ route:EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}
