//
//  ClientRequest.swift
//  DesafioGuiaBolso
//
//  Created by Paulo Rosa on 24/01/20.
//  Copyright © 2020 Paulo Rosa. All rights reserved.
//

import UIKit

public enum NetworkError : String, Error, Equatable {

    case parametersNil = "Parameters are nil"
    case encodingFailed = "Encode Fail"
    case missingURL = "Missing URL"

    public static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }

}
