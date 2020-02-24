//
//  StringExtension.swift
//  DesafioGuiaBolso
//
//  Created by Paulo Rosa on 25/01/20.
//  Copyright © 2020 Paulo Rosa. All rights reserved.
//

import Foundation

extension String {
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    static func empty() -> String {
        return ""
    }
    
}
