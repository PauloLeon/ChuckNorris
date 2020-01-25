//
//  ClientRequest.swift
//  DesafioGuiaBolso
//
//  Created by Paulo Rosa on 24/01/20.
//  Copyright © 2020 Paulo Rosa. All rights reserved.
//

import UIKit

protocol EndPointManager {
    associatedtype T:EndPointType
    var router:Router<T> { get }    
}

extension EndPointManager {
    var router:Router<Self.T> {
        return Router<Self.T>()
    }
}
