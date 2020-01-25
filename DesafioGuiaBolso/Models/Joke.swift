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
    let categories: [String]?
    let createdAt: String?
    let iconURL: String?
    let id, updatedAt: String?
    let url: String?
    let value: String?

    enum CodingKeys: String, CodingKey {
        case categories
        case createdAt = "created_at"
        case iconURL = "icon_url"
        case id
        case updatedAt = "updated_at"
        case url, value
    }
}
