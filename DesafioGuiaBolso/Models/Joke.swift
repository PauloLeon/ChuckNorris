//
//  Joke.swift
//  DesafioGuiaBolso
//
//  Created by Paulo Rosa on 25/01/20.
//  Copyright © 2020 Paulo Rosa. All rights reserved.
//

import Foundation

// MARK: - Joke
public struct Joke: Codable {
    var categories: [String]?
    var createdAt: String?
    var iconURL: String?
    var id, updatedAt: String?
    var url: String?
    var value: String?

    enum CodingKeys: String, CodingKey {
        case categories
        case createdAt = "created_at"
        case iconURL = "icon_url"
        case id
        case updatedAt = "updated_at"
        case url, value
    }
    
    init() {
        categories =  []
        createdAt = nil
        iconURL = nil
        id = nil
        updatedAt = nil
        url = nil
        value = nil
    }
    
}
